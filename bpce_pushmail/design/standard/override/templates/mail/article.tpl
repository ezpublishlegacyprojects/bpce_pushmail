<SPAN class=titremoyen>{$node.name|wash}</SPAN><BR><BR>
{if $node.data_map.image.content.is_valid}
<img align="left" style="margin-right:9px;margin-bottom:9px" src={$node.data_map.image.content.medium.url|ezroot()} />
{/if}
<div class="chapeau">
{attribute_view_gui attribute=$node.data_map.intro}</div>
<div class="clear">&nbsp;</div>
<div class="info">
	<a href="{$node.url_alias|ezurl(no)}" > >>> click here for more information...</a>
</div>