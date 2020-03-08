[{if $oView->getClassName()=='start' || $oView->getClassName()=="alist" || $oView->getClassName()=="content"}]
    [{if $oView->getBanners() && !empty($oView->getBanners())}]
        [{include file="widget/promoslider.tpl"}]
    [{/if}]
[{/if}]

