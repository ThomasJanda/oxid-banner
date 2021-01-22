[{assign var="aBanners" value=$oView->getBanners()}]
[{if $aBanners|@count}]
    [{oxstyle include=$oViewConf->getModuleUrl("rs_banner", "out/src/style/css.css")}]
    [{assign var="oConfig"    value=$oViewConf->getConfig()}]
    [{assign var="bStartNivoSlider" value=false}]
    </div>
    [{foreach from=$aBanners item=aRow name=row}]
        [{if $aRow|@count > 0}]
            <div class="row rs-banner-row ">
                [{math assign=iColWidth equation="floor(12 / y)" y=$aRow|@count}]
                [{math assign=iColCount equation="12 / y" y=$iColWidth}]
                [{foreach from=$aRow item=aCol name=col}]
                    <div class="rs-banner-cell col-[{$iColWidth}]">
                        [{if $aCol|@count == 1}]
                            [{foreach from=$aCol item=oBanner}]
                                [{assign var="sBannerLink" value=$oBanner->getBannerLink()}]
                                [{assign var=sTitle value=$oBanner->oxactions__oxtitle->value}]
                                [{assign var=sShortDesc value=""}]
                                [{assign var="oArticle" value=$oBanner->getBannerArticle()}]
                                [{if $oArticle}]
                                    [{assign var=sTitle value=$oArticle->oxarticles__oxtitle->value|trim}]
                                    [{assign var=sShortDesc value=$oArticle->oxarticles__oxshortdesc->value|trim}]                        
                                [{/if}]
                                [{if $oBanner->oxactions__rsshow_alternative_title->value}]
                                    [{assign var=sTitle value=$oBanner->oxactions__rsalternative_title->value|trim}]
                                [{/if}]
                                [{if $oBanner->oxactions__rsshow_alternative_short->value}]
                                    [{assign var=sShortDesc value=$oBanner->oxactions__rsalternative_short->getRawValue()|trim|nl2br}]
                                [{/if}]
                                
                                [{assign var="sBannerPictureUrl" value=$oBanner->getBannerPictureUrl()}]
                                [{if $sBannerPictureUrl}]                                
                                    
                                    [{if $sBannerLink}]<a href="[{$sBannerLink}]" title="[{$sTitle}]">[{/if}]
                                    <img class="rs-banner-image" src="[{$sBannerPictureUrl}]" alt="[{$sTitle}]" title="[{$sTitle}]">
                                    [{if $sBannerLink}]</a>[{/if}]
                                    [{if $oViewConf->getViewThemeParam('blSliderShowImageCaption') && ($sTitle!="" || $sShortDesc!="")}]
                                        <p class="flex-caption [{$oConfig->getConfigParam('rs-banner_nivo_slider_captionClass')}]">
                                            [{if $sBannerLink}]<a href="[{$sBannerLink}]" class="flex-caption-link" title="[{$sTitle}]">[{/if}]
                                            [{if $sTitle!=""}]<span class="title">[{$sTitle}]</span>[{/if}]
                                            [{if $sTitle!="" && $sShortDesc!=""}]<br>[{/if}]
                                            [{if $sShortDesc!=""}]<span class="shortdesc">[{$sShortDesc}]</span>[{/if}]
                                            [{if $sBannerLink}]</a>[{/if}]
                                        </p>
                                    [{/if}]
                                [{/if}]
                            [{/foreach}]
                        [{else}]
                            [{assign var="bStartNivoSlider" value=true}]
                            [{assign var=rs_banner_slider_image value=""}]
                            [{assign var=rs_banner_slider_caption value=""}]
                            [{foreach from=$aCol item=oBanner}]
                                
                                [{assign var="sBannerLink" value=$oBanner->getBannerLink()}]
                                [{assign var=sTitle value=$oBanner->oxactions__oxtitle->value}]
                                [{assign var=sShortDesc value=""}]
                                [{assign var="oArticle" value=$oBanner->getBannerArticle()}]
                                [{if $oArticle}]
                                    [{assign var=sTitle value=$oArticle->oxarticles__oxtitle->value|trim}]
                                    [{assign var=sShortDesc value=$oArticle->oxarticles__oxshortdesc->value|trim}]                        
                                [{/if}]
                                [{if $oBanner->oxactions__rsshow_alternative_title->value}]
                                    [{assign var=sTitle value=$oBanner->oxactions__rsalternative_title->value|trim}]
                                [{/if}]
                                [{if $oBanner->oxactions__rsshow_alternative_short->value}]
                                    [{assign var=sShortDesc value=$oBanner->oxactions__rsalternative_short->getRawValue()|trim|nl2br}]
                                [{/if}]
                                
                                [{assign var="sBannerPictureUrl" value=$oBanner->getBannerPictureUrl()}]
                                [{if $sBannerPictureUrl}]
                                    
                                    [{assign var=bHasCaption value=false}]
                                    [{capture name="rs_banner_slider_caption"}]
                                        [{if $oViewConf->getViewThemeParam('blSliderShowImageCaption') && ($sTitle!="" || $sShortDesc!="")}]
                                            [{assign var=bHasCaption value=true}]
                                            <div id="htmlcaption_[{$oBanner->getId()}]" class="nivo-html-caption">
                                                [{if $sBannerLink}]<a href="[{$sBannerLink}]" class="flex-caption-link" title="[{$sTitle}]">[{/if}]
                                                [{if $sTitle!=""}]<span class="title">[{$sTitle}]</span>[{/if}]
                                                [{if $sTitle!="" && $sShortDesc!=""}]<br>[{/if}]
                                                [{if $sShortDesc!=""}]<span class="shortdesc">[{$sShortDesc}]</span>[{/if}]
                                                [{if $sBannerLink}]</a>[{/if}]
                                            </div>
                                        [{/if}]
                                    [{/capture}]
                                    
                                    [{capture name="rs_banner_slider_image"}]
                                        [{if $sBannerLink}]<a href="[{$sBannerLink}]" title="[{$sTitle}]">[{/if}]
                                        <img src="[{$sBannerPictureUrl}]" 
                                             data-thumb="[{$sBannerPictureUrl}]" 
                                             alt="[{$sTitle}]" 
                                             title="[{if $bHasCaption}]#htmlcaption_[{$oBanner->getId()}][{/if}]">
                                        [{if $sBannerLink}]</a>[{/if}]
                                    [{/capture}]
                                    
                                    [{assign var=rs_banner_slider_image value=$rs_banner_slider_image|cat:$smarty.capture.rs_banner_slider_image}]
                                    [{assign var=rs_banner_slider_caption value=$rs_banner_slider_caption|cat:$smarty.capture.rs_banner_slider_caption}]
                                [{/if}]
                            [{/foreach}]
                            
                            <div class="slider-wrapper theme-default">
                                <div id="slider" class="nivoSlider rs-banner-nivoslider">
                                    [{$rs_banner_slider_image}]
                                </div>
                                [{$rs_banner_slider_caption}]
                            </div>
                            
                        [{/if}]
                    </div>
                [{/foreach}]
            </div>
        [{/if}]
    [{/foreach}]
    
    [{if $bStartNivoSlider}]
        [{oxstyle include=$oViewConf->getModuleUrl("rs_banner", "out/src/Nivo-Slider/themes/default/default.css")}]
        [{oxstyle include=$oViewConf->getModuleUrl("rs_banner", "out/src/Nivo-Slider/nivo-slider.css")}]
        [{oxscript include=$oViewConf->getModuleUrl("rs_banner", "out/src/Nivo-Slider/jquery.nivo.slider.js")}]
        [{capture name="rsscript"}]
            [{capture}]<script>[{/capture}]
                [{* https://docs.themeisle.com/article/487-nivo-slider-settings *}]
                $('.rs-banner-nivoslider').nivoSlider({ 
                    effect: '[{$oConfig->getConfigParam('rs-banner_nivo_slider_effect')}]',
                    animSpeed: [{$oConfig->getConfigParam('rs-banner_nivo_slider_animSpeed')}],
                    pauseTime: [{$oConfig->getConfigParam('rs-banner_nivo_slider_pauseTime')}],
                    directionNav: [{if $oConfig->getConfigParam('rs-banner_nivo_slider_directionNav')}]true[{else}]false[{/if}],
                    controlNav: [{if $oConfig->getConfigParam('rs-banner_nivo_slider_controlNav')}]true[{else}]false[{/if}]
                });
                [{if $oConfig->getConfigParam('rs-banner_nivo_slider_captionClass') !=""}]
                    $('.nivo-caption').addClass('[{$oConfig->getConfigParam('rs-banner_nivo_slider_captionClass')}]');
                [{/if}]
            [{capture}]</script>[{/capture}]
        [{/capture}]
        [{oxscript add=$smarty.capture.rsscript}]
    [{/if}]
    <div class="row">
[{/if}]