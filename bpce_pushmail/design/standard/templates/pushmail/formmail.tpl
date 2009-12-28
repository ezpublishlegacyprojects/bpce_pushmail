<div class="border-box">
<div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
<div class="border-ml"><div class="border-mr"><div class="border-mc float-break">

<div class="title">
	<h1>{'Sending page %name% by mail'|i18n( 'extension/bpce_mail', '', hash( '%name%', $nodename|wash() ) )}</h1>
</div>
<br>
<p>
{if eq($nodeid, 0)}
<div class="warning">
<h2>{'Error. Page not found'|i18n( 'extension/bpce_mail' )}</h2>
</div>
{else}
<form method="post" action={"pushmail/action"|ezurl}>
	<div id="panel_output_bpce_mail">
		You can push mail to these groups or to the email you set in the textbox (email is ) 	<br />
		<input type="hidden" name="NodeID" value="{$nodeid}" />
		<br />Group name : <select name="RecipientGroup" title="">
		{foreach $groupslist as $group}
		    <option value="{$group.node_id}">{$group.name|wash}</option>
		{/foreach}
        </select>
		<br /><br />Email : <input type="text" name="RecipientEmail" />
		<br /><br /><input type="submit" name="BFBPMailItButton" class="button" value="{"Send"|i18n( 'extension/bpce_mail' )}" />
	</div>
</form>
<br />
<a href={$nodeurl|ezurl()}>{"Go to"|i18n( 'extension/bpce_mail' )} '{$nodename|wash()}'</a>
<br>
{/if}
</p>
</div></div></div>
<div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
</div>