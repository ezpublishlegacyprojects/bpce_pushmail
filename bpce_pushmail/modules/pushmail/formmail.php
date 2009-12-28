<?php
/**
* @author A. Sebbane
* @version $Id$
* @copyright
*/

//$http = eZHTTPTool::instance();

$NodeID = $Params['NodeID'];
$nodeName = '[???]';
$nodeAddress = '/';
$groupsList = array();

$node = eZContentObjectTreeNode::fetch( $NodeID );
if ( $node )
{
    $nodeName = $node->getName();
    $nodeAddress = $node->urlAlias();

    // all user groups that current user 'can read'
    $siteINI = eZINI::instance();
    $groupsList = eZContentObjectTreeNode::subTreeByNodeID( array(
        'AsObject' => true,
        'Depth' => 10,
        'ClassFilterType' => 'include',
        'ClassFilterArray' => array( $siteINI->variable( 'UserSettings', 'UserGroupClassID' ) ),
        ), 5 );
}
else
{
    $NodeID = 0;
}

include_once( 'kernel/common/template.php' );
$tpl = templateInit();

$tpl->setVariable( 'nodeid', $NodeID );
$tpl->setVariable( 'nodename', $nodeName );
$tpl->setVariable( 'nodeurl', $nodeAddress );
$tpl->setVariable( 'groupslist', $groupsList );

// Process template and set path data
$Result = array();
$Result['content'] = $tpl->fetch( 'design:pushmail/formmail.tpl' );
$Result['path'] = array( array( 'url' => false,
                                'text' => ezi18n( 'extension/bpce_mail', 'bpce_mail' ) ) );

?>
