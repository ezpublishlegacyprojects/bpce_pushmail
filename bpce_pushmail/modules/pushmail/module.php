<?php
/**
* @author A. Sebbane
* @version $Id$
* @copyright
*
* Les actions AddAssignment et RemoveAssignment sont copiées de content/action
*/

$Module = array( 'name' => 'BPCE Push Mail' , 'variable_params' => true );
$ViewList = array();

$ViewList['formmail'] = array(
    'script' => 'formmail.php',
    'functions' => array( 'pushmail' ),
    'params' => array( 'NodeID' ) );

$ViewList['action'] = array(
    'script' => 'action.php',
    'single_post_actions' => array( 'BFBPMailItButton' => 'MailIt' ),
    'functions' => array( 'pushmail' ),
    'post_action_parameters' => array(
        'MailIt' => array(
            'RecipientEmail' => 'RecipientEmail',
            'NodeID'         => 'NodeID',
            'RecipientGroup' => 'RecipientGroup' )
        ) );

$FunctionList = array();
$FunctionList['pushmail'] = array();
?>