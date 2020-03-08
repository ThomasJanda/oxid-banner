[{if $oView->getClassName()=='start' && $oView->getBanners() && !empty($oView->getBanners())}]
    [{include file="widget/promoslider.tpl"}]
[{else $oView->getClassName()=='alist' && $oView->getBanners() && !empty($oView->getBanners())}]
    [{include file="widget/promoslider.tpl"}]
[{/if}]

