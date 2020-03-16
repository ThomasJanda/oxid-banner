<tr>
    <td class="text">
        <b>Zeilen / Spalten Sortierung:</b>
    </td>
    <td class="text" colspan="2">
        <select name="editval[oxactions__rsrow]" [{$readonly}]>
            <option value="1" [{if $edit->oxactions__rsrow->value=="1"}] selected [{/if}]>1</option>
            <option value="2" [{if $edit->oxactions__rsrow->value=="2"}] selected [{/if}]>2</option>
            <option value="3" [{if $edit->oxactions__rsrow->value=="3"}] selected [{/if}]>3</option>
            <option value="4" [{if $edit->oxactions__rsrow->value=="4"}] selected [{/if}]>4</option>
            <option value="5" [{if $edit->oxactions__rsrow->value=="5"}] selected [{/if}]>5</option>
            <option value="6" [{if $edit->oxactions__rsrow->value=="6"}] selected [{/if}]>6</option>
            <option value="7" [{if $edit->oxactions__rsrow->value=="7"}] selected [{/if}]>7</option>
            <option value="8" [{if $edit->oxactions__rsrow->value=="8"}] selected [{/if}]>8</option>
            <option value="9" [{if $edit->oxactions__rsrow->value=="9"}] selected [{/if}]>9</option>
            <option value="10" [{if $edit->oxactions__rsrow->value=="10"}] selected [{/if}]>10</option>
            <option value="11" [{if $edit->oxactions__rsrow->value=="11"}] selected [{/if}]>11</option>
            <option value="12" [{if $edit->oxactions__rsrow->value=="12"}] selected [{/if}]>12</option>
        </select>
        <select name="editval[oxactions__rscol]" [{$readonly}]>
            <option value="1" [{if $edit->oxactions__rscol->value=="1"}] selected [{/if}]>1</option>
            <option value="2" [{if $edit->oxactions__rscol->value=="2"}] selected [{/if}]>2</option>
            <option value="3" [{if $edit->oxactions__rscol->value=="3"}] selected [{/if}]>3</option>
            <option value="4" [{if $edit->oxactions__rscol->value=="4"}] selected [{/if}]>4</option>
            <option value="5" [{if $edit->oxactions__rscol->value=="5"}] selected [{/if}]>5</option>
            <option value="6" [{if $edit->oxactions__rscol->value=="6"}] selected [{/if}]>6</option>
            <option value="7" [{if $edit->oxactions__rscol->value=="7"}] selected [{/if}]>7</option>
            <option value="8" [{if $edit->oxactions__rscol->value=="8"}] selected [{/if}]>8</option>
            <option value="9" [{if $edit->oxactions__rscol->value=="9"}] selected [{/if}]>9</option>
            <option value="10" [{if $edit->oxactions__rscol->value=="10"}] selected [{/if}]>10</option>
            <option value="11" [{if $edit->oxactions__rscol->value=="11"}] selected [{/if}]>11</option>
            <option value="12" [{if $edit->oxactions__rscol->value=="12"}] selected [{/if}]>12</option>
        </select>
    </td>
</tr>

<tr>
    <td class="text">
        <b>Anzeigen auf Kategorie-Seite:</b>
    </td>
    <td class="text" colspan="2">
        <select name="editval[oxactions__f_oxcategories]" [{$readonly}]>
            <option value="">Bitte wählen</option>
                [{foreach from=$cattree item=pcat}]
                    <option value="[{$pcat->oxcategories__oxid->value}]" 
                            [{if $edit->oxactions__f_oxcategories->value==$pcat->oxcategories__oxid->value}] selected [{/if}]
                            >[{$pcat->oxcategories__oxtitle->getRawValue()|oxtruncate:40:"..":true}]</option>
                [{/foreach}]
        </select>
    </td>
</tr>
<tr>
    <td class="text">
        <b>Anzeigen auf CMS-Seite:</b>
    </td>
    <td class="text" colspan="2">
        <select name="editval[oxactions__f_oxcontents]" [{$readonly}]>
            <option value="">Bitte wählen</option>
                [{foreach from=$contentlist item=pcat}]
                    <option value="[{$pcat->oxcontents__oxid->value}]" 
                            [{if $edit->oxactions__f_oxcontents->value==$pcat->oxcontents__oxid->value}] selected [{/if}]
                            >[{$pcat->oxcontents__oxtitle->getRawValue()|oxtruncate:40:"..":true}] ([{$pcat->oxcontents__oxloadid->value}])</option>
                [{/foreach}]
        </select>
    </td>
</tr>
<tr>
    <td class="text">
        <b>Nicht anzeigen auf Start-Seite:</b>
    </td>
    <td class="text" colspan="2">
        <input type="hidden" name="editval[oxactions__rsnot_startpage]" value="0">
        <input type="checkbox" name="editval[oxactions__rsnot_startpage]" value="1" [{if $edit->oxactions__rsnot_startpage->value==1}] checked [{/if}]>
    </td>
</tr>
<tr>
    <td class="text">
        <b>Alternativen Titel anzeigen:</b>
    </td>
    <td class="text" colspan="2">
        <input type="hidden" name="editval[oxactions__rsshow_alternative_title]" value="0">
        <input type="checkbox" name="editval[oxactions__rsshow_alternative_title]" value="1" [{if $edit->oxactions__rsshow_alternative_title->value==1}] checked [{/if}]>
    </td>
</tr>
<tr>
    <td class="text">
        <b>Alternativer Titel (max. 250 Zeichen)</b>
    </td>
    <td class="text" colspan="2">
        <input type="textbox" name="editval[oxactions__rsalternative_title]" value="[{$edit->oxactions__rsalternative_title->value}]">
    </td>
</tr>
<tr>
    <td class="text">
        <b>Alternative Kurzbeschreibung:</b>
    </td>
    <td class="text" colspan="2">
        <input type="hidden" name="editval[oxactions__rsshow_alternative_short]" value="0">
        <input type="checkbox" name="editval[oxactions__rsshow_alternative_short]" value="1" [{if $edit->oxactions__rsshow_alternative_short->value==1}] checked [{/if}]>
    </td>
</tr>
<tr>
    <td class="text">
        <b>Alternative Kurzbeschreibung (max. 250 Zeichen)</b>
    </td>
    <td class="text" colspan="2">
        <textarea name="editval[oxactions__rsalternative_short]">[{$edit->oxactions__rsalternative_short->value}]</textarea>
    </td>
</tr>