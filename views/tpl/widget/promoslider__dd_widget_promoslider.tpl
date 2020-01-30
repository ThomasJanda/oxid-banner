[{assign var="aBanners" value=$oView->getBanners()}]
[{if $aBanners|@count}]
    [{oxstyle include=$oViewConf->getModuleUrl("rs_banner", "out/src/style/css.css")}]
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
                                [{assign var="oArticle" value=$oBanner->getBannerArticle()}]
                                [{assign var="sBannerPictureUrl" value=$oBanner->getBannerPictureUrl()}]
                                [{if $sBannerPictureUrl}]                                
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
                                [{/if}]
                            [{/foreach}]
                        [{else}]
                            [{assign var="bStartNivoSlider" value=true}]
                            [{assign var=rs_banner_slider_image value=""}]
                            [{assign var=rs_banner_slider_caption value=""}]
                            [{foreach from=$aCol item=oBanner}]
                                [{assign var="oArticle" value=$oBanner->getBannerArticle()}]
                                [{assign var="sBannerPictureUrl" value=$oBanner->getBannerPictureUrl()}]
                                [{if $sBannerPictureUrl}]
                                    
                                    [{assign var=bHasCaption value=false}]
                                    [{capture name="rs_banner_slider_caption"}]
                                        [{if $oViewConf->getViewThemeParam('blSliderShowImageCaption') && $oArticle}]
                                            [{assign var=bHasCaption value=true}]
                                            <div id="htmlcaption_[{$oBanner->getId()}]" class="nivo-html-caption">
                                                [{if $sBannerLink}]
                                                    <a href="[{$sBannerLink}]" class="flex-caption-link" title="[{$oBanner->oxactions__oxtitle->value}]">
                                                [{/if}]
                                                <span class="title">[{$oArticle->oxarticles__oxtitle->value}]</span>[{if $oArticle->oxarticles__oxshortdesc->value|trim}]<br/><span class="shortdesc">[{$oArticle->oxarticles__oxshortdesc->value|trim}]</span>[{/if}]
                                                [{if $sBannerLink}]
                                                    </a>
                                                [{/if}]
                                            </div>
                                        [{/if}]
                                    [{/capture}]
                                    
                                    [{capture name="rs_banner_slider_image"}]
                                        [{assign var="sBannerLink" value=$oBanner->getBannerLink()}]
                                        [{if $sBannerLink}]
                                            <a href="[{$sBannerLink}]" title="[{$oBanner->oxactions__oxtitle->value}]">
                                        [{/if}]
                                        <img src="[{$sBannerPictureUrl}]" 
                                             data-thumb="[{$sBannerPictureUrl}]" 
                                             alt="[{$oBanner->oxactions__oxtitle->value}]" 
                                             title="[{if $bHasCaption}]#htmlcaption_[{$oBanner->getId()}][{/if}]">
                                        [{if $sBannerLink}]
                                            </a>
                                        [{/if}]
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
        [{oxstyle include=$oViewConf->getModuleUrl("rs_banner", "out/src/Nivo-Slider-jQuery-master/themes/default/default.css")}]
        [{oxstyle include=$oViewConf->getModuleUrl("rs_banner", "out/src/Nivo-Slider-jQuery-master/nivo-slider.css")}]
        [{oxscript include=$oViewConf->getModuleUrl("rs_banner", "out/src/Nivo-Slider-jQuery-master/jquery.nivo.slider.js")}]
        [{oxscript add="$('.rs-banner-nivoslider').nivoSlider({ controlNav:false });"}]
    [{/if}]
    <div class="row">
[{/if}]