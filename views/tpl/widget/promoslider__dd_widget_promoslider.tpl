[{assign var="aBanners" value=$oView->getBanners()}]
[{if $aBanners|@count}]
    [{oxstyle include=$oViewConf->getModuleUrl("rs_banner", "out/src/style/css.css")}]
    </div>
    [{foreach from=$aBanners item=aRow name=row}]
        [{if $aRow|@count > 0}]
            <div class="row rs-banner-row ">
                [{math assign=iColWidth equation="floor(12 / y)" y=$aRow|@count}]
                [{math assign=iColCount equation="12 / y" y=$iColWidth}]
                [{foreach from=$aRow item=oBanner name=col}]
                    [{assign var="oArticle" value=$oBanner->getBannerArticle()}]
                    [{assign var="sBannerPictureUrl" value=$oBanner->getBannerPictureUrl()}]
                    [{if $sBannerPictureUrl}]
                        <div class="rs-banner-cell col-[{$iColWidth}]">
                            [{assign var="sBannerLink" value=$oBanner->getBannerLink()}]
                            [{if $sBannerLink}]
                                <a href="[{$sBannerLink}]" title="[{$oBanner->oxactions__oxtitle->value}]">
                            [{/if}]
                            <img class="rs-banner-image" src="[{$sBannerPictureUrl}]" alt="[{$oBanner->oxactions__oxtitle->value}]" title="[{$oBanner->oxactions__oxtitle->value}]">
                            [{if $sBannerLink}]
                                </a>
                            [{/if}]
                            [{if $oViewConf->getViewThemeParam('blSliderShowImageCaption') && $oArticle}]
                                <p class="flex-caption">
                                    [{if $sBannerLink}]
                                    <a href="[{$sBannerLink}]" class="flex-caption-link" title="[{$oBanner->oxactions__oxtitle->value}]">
                                        [{/if}]
                                        <span class="title">[{$oArticle->oxarticles__oxtitle->value}]</span>[{if $oArticle->oxarticles__oxshortdesc->value|trim}]<br/><span class="shortdesc">[{$oArticle->oxarticles__oxshortdesc->value|trim}]</span>[{/if}]
                                        [{if $sBannerLink}]
                                    </a>
                                    [{/if}]
                                </p>
                            [{/if}]
                        </div>
                    [{/if}]
                [{/foreach}]
            </div>
        [{/if}]
    [{/foreach}]
    <div class="row">
[{/if}]