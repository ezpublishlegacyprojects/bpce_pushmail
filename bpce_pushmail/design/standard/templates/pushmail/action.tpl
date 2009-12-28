{*?template charset=utf8?*}
<div class="border-box">
<div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
<div class="border-ml"><div class="border-mr"><div class="border-mc float-break">

<div class="title">
	<h1>{'Sending page %name% by mail'|i18n( 'extension/bpce_mail', '', hash( '%name%', $nodename|wash() ) )}</h1>
</div>
<p>	
	{if eq($errormessage, '')}
		{"Mail sent"|i18n( 'extension/bpce_mail' )}<br />
	{else}
		{"Mail not sent"|i18n( 'extension/bpce_mail' )}<br />
	{/if}
	<br />
	<a href={$nodeurl|ezurl}>{"Go to"|i18n( 'extension/bpce_mail' )} '{$nodename|wash}'</a>
</p>


</div></div></div>
<div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
</div>