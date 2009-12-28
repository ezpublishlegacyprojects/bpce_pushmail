{if and( 
            ezini( 'IsMailTemplate', 'ShowClasses', 'bpce_pushmail.ini' )|contains( $current_node.class_identifier )  ,
            and( $content_object.can_create, $is_container) 
         )}
   <a href={concat("/pushmail/formmail/",$current_node.node_id)|ezurl} title="{'Mail'|i18n('extension/bpce_mail')}"><img src={"ezwt-icon-mail.gif"|ezimage} alt="{'bpce_mail'|i18n('extension/bpce_mail')}" /></a>
{/if}