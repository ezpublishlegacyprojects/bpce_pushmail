<?php
/**
* @author A. Sebbane
* @version $Id$
* @copyright
*
* @todo check links to images,css, js in the generated page. Are they ok when viewed eg. in hotmail?
*       Otherwise a view other than full needs to be set up (or some other workaround)
*/

include_once( 'kernel/common/template.php' );
$tpl = templateInit();

$module = $Params["Module"];

$viewMode = 'full';
if ( $module->hasActionParameter( 'ViewMode' ) )
    $viewMode = $module->actionParameter( 'ViewMode' );
if ( $module->hasActionParameter( 'LanguageCode' ) )
    $languageCode = $module->actionParameter( 'LanguageCode' );
else
{
    $languageCode = false;
}
$siteINI = eZINI::instance();
$userClassID = $siteINI->variable( "UserSettings", "UserClassID" );

if ( $module->isCurrentAction( 'MailIt' ) )
{

    // parametres post
    $nodeID    = (int)$module->actionParameter( 'NodeID' );
    $recipientGroup = (int)$module->actionParameter( 'RecipientGroup' );
    $recipient = $module->actionParameter( 'RecipientEmail' );

    $node = eZContentObjectTreeNode::fetch( $nodeID );
    $nodename = '[???]';
    $nodeurl = '/';
    $errormessage = 'Error. Page not found';

    if ( $node != null )
    {
    	$objet = $node->object();
        $nodename = $node->getName();
        $nodeurl = $node->urlAlias();
		$tpl->resetVariables();
		$tpl->setVariable( 'node', $node );
		//	Récupération du contenu du mail
    	$params = array( 'ezdesign:keys' => array( array( 'class_identifier', $node->attribute( 'class_identifier' ) ), array( 'section', $objet->attribute( 'section_id' ) ) ) );
		
		$Result = $tpl->fetch( 'design:node/view/mail.tpl', $params, true );
		$Result['content'] = $Result['result_text'];
		//	Incorporation dans le pagelayout
		$tpl->setVariable( 'module_result', $Result );
		$Result = $tpl->fetch( 'design:pagelayout_mail.tpl', false, true );
		
		//	Body du mail
		$pageContent = $Result['result_text'];
        if ( $pageContent != '' ){
            // si les params 2 sont recus en meme temps, c'est recipient qui prime
            $mail = new eZMail();
            $mail->setContentType( 'text/html' );
            $i = 0;
			if ( $recipient != '' ){
                $recipientList = array( $recipient );
            } else {
                // recuperer les emails de tous les membres du groupe
                $recipientList = array();
                $users = eZContentObjectTreeNode::subTreeByNodeID( array(
                    'AsObject' => true,
                    /// @bug cette limite est completement arbitraire...
                    'Depth' => 10,
                    'ClassFilterType' => 'include',
                    'ClassFilterArray' => array( $siteINI->variable( 'UserSettings', 'UserClassID' ) ),
                ), $recipientGroup );
                foreach( $users as $user )
                {
                    $user = $user->attribute( 'contentobject_id' );
                    $user = eZUser::fetch( $user );
                    $recipientList[] = $user->attribute( 'email' );
                }
				foreach( $recipientList as $recipient ){
                if ( $mail->validate( $recipient ) ){
                    $mail->addReceiver( $recipient );
                    ++$i;
                } else {
                    eZDebug::writeWarning("pushmail: adresse email invalide: $recipient");
                }
				}
            }
           
            

            if ( $i )
            {
                if (($siteINI->variable( 'MailSettings', 'EmailSender' ) != '')||($siteINI->variable( 'MailSettings', 'AdminEmail' ) != '' )){
					$user = eZUser::currentUser();
					$sender=$siteINI->variable( 'MailSettings', 'EmailSender' );
					if (!$mail->validate( $sender )){
						$sender=$siteINI->variable( 'MailSettings', 'AdminEmail' );
					}
                    $mail->setSender($sender);
                    $mail->setReplyTo( $user->attribute( 'email' ) );
                    $mail->setSubject( $nodename );
                    $mail->setBody( $pageContent );
                    $mailResult = eZMailTransport::send( $mail );
                    if ( $mailResult )
                    {
                        $errormessage = '';
                    }
                    else
                    {
                        $errormessage = 'Could not send email (error in communication with mail server)';
                    }
                }
                else
                {
                    $errormessage = 'Email sender is not defined';
                }
            }
            else
            {
                $errormessage = 'Invalid email address';
            }
        }
        else
        {
            $errormessage = 'Could not generate mail version of page';
        }
    }

    $tpl->resetVariables();

    $tpl->setVariable( 'nodeid', $nodeID );
    $tpl->setVariable( 'nodename', $nodename );
    $tpl->setVariable( 'nodeurl', $nodeurl );
    $tpl->setVariable( 'errormessage', $errormessage );

    $Result['content'] = $tpl->fetch( 'design:pushmail/action.tpl' );
    $Result['path']    = array( array( 'text' => ezi18n( 'extension/bpce_mail', 'bpce_mail' ),
                                       'url'  => false ),
                                array( 'text' => $nodename,
                                       'url'  => $nodeurl ) );
    return;
}else{
    $siteINI = eZINI::instance( 'site.ini' );
    $module->redirectTo( $siteINI->variable( 'SiteSettings', 'IndexPage' ) );
}
?>