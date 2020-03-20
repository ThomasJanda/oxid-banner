[{if $oView->getBanners() && !empty($oView->getBanners())}]
    [{assign var="blFullwidth" value=$oViewConf->getViewThemeParam('blFullwidthLayout')}]
    <div class="[{if $blFullwidth}]container-fluid[{else}]container[{/if}]">
        [{include file="widget/promoslider.tpl"}]
    </div>
[{/if}]