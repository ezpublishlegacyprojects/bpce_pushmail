{if and(is_set( $module_result.content_info.node_id ),ezini('IsMailTemplate','ShowClasses','bpce_pushmail.ini')|contains($module_result.content_info.class_identifier))}
<div id="bpce_mail">
<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr">{section show=$first}<div class="box-tl"><div class="box-tr">{/section}
<h4>{"Mail to"|i18n( 'extension/bpce_mail' )}</h4>
</div></div></div></div>{section show=$first}</div></div>{/section}
{if $last}
<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-bl"><div class="box-br"><div class="box-content">
{else}
<div class="box-ml"><div class="box-mr"><div class="box-content">
{/if}

<div class="block">

<form name="browse" method="post" action={"pushmail/action"|ezurl}>
<div id="panel_output_bpce_mail">
    <input type="hidden" name="NodeID" value="{$module_result.content_info.node_id}" />
    {def $user=fetch( 'user', 'current_user' )}
    <input type="text" name="RecipientEmail" value="{$user.name}" /><br />
    <input type="submit" name="BFBPMailItButton" class="button" value="{"Ok"|i18n( 'extension/bpce_mail' )}" />
</div>
</form>
</div>
</div></div></div>{if $last}</div></div></div>{/if}
</div>
{/if}