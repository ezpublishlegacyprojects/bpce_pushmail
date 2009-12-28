{*?template charset=utf8?*}
{if eq($errormessage, '')}
	<h1>{'Mail sent'|i18n( 'extension/bpce_mail' )}</h1>
{else}
	<h1>{'Mail not sent'|i18n( 'extension/bpce_mail' )}</h1>
	<p>{$errormessage}</p>
{/if}
<a href={$nodeurl|ezurl()}>{'Go to'|i18n( 'extension/bpce_mail' )} '{$nodename|wash()}'</a>
