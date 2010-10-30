<#macro GenericWizard screen>
<#assign model = screen.model>
<!-- normally you make one big form for the whole plugin-->
<form method="post" enctype="multipart/form-data" name="${screen.name}">
	<!--needed in every form: to redirect the request to the right screen-->
	<input type="hidden" name="__target" value="${screen.name}"" />
	<!--needed in every form: to define the action. This can be set by the submit button-->
	<input type="hidden" name="__action" />
	<!--need to be set to "true" in order to force a download-->
	<input type="hidden" name="__show" />
	
	<#assign bgColor = "#ffffff">
	<#assign borderStyle = "solid">
	<#assign borderWidthSpacing = "1px">
	<#assign picSize = "15">
	<#assign padding = "5px">
	
	<#assign style1 = "style=\"padding: ${padding}; border-width: ${borderWidthSpacing}; border-spacing: ${borderWidthSpacing}; border-style: ${borderStyle}; border-color: #800000; background-color: ${bgColor};\"">
	<#assign style2 = "style=\"padding: ${padding}; border-width: ${borderWidthSpacing}; border-spacing: ${borderWidthSpacing}; border-style: ${borderStyle}; border-color: #0000FF; background-color: ${bgColor};\"">
	<#assign styleWhite = "style=\"padding: ${padding}; border-width: ${borderWidthSpacing}; border-spacing: ${borderWidthSpacing}; border-style: ${borderStyle}; border-color: #FFFFFF; background-color: ${bgColor};\"">
	<#assign styleGreen = "style=\"padding: ${padding}; border-width: ${borderWidthSpacing}; border-spacing: ${borderWidthSpacing}; border-style: ${borderStyle}; border-color: #00FF00; background-color: ${bgColor};\"">
	<#assign styleBlack = "style=\"padding: ${padding}; border-width: ${borderWidthSpacing}; border-spacing: ${borderWidthSpacing}; border-style: ${borderStyle}; border-color: #000000; background-color: ${bgColor};\"">
	
	
	<#assign green = "style=\"padding: ${padding}; border-width: ${borderWidthSpacing}; border-spacing: ${borderWidthSpacing}; border-style: ${borderStyle}; border-color: #00FF00; background-color: #00FF00;\"">
	<#assign orange = "style=\"padding: ${padding}; border-width: ${borderWidthSpacing}; border-spacing: ${borderWidthSpacing}; border-style: ${borderStyle}; border-color: #FF8040; background-color: #FF8040;\"">
	<#assign red = "style=\"padding: ${padding}; border-width: ${borderWidthSpacing}; border-spacing: ${borderWidthSpacing}; border-style: ${borderStyle}; border-color: #FF0000; background-color: #FF0000;\"">
	
	<#assign center = "align=\"center\"">
	<#assign courier = "<font face=\"Courier New, Courier, mono, serif\">">	
	<#assign endFont = "</font>">
	
	<#assign greenBg = "<font style=\"background-color: #52D017\">"> <#--successmess: 52D017-->
	<#assign redBg = "<font style=\"background-color: red; color: white; font-weight:bold\">">
		
<!-- this shows a title and border -->
	<div class="formscreen">
		<div class="form_header" id="${screen.getName()}">
		${screen.label}
		</div>
		
		<#--optional: mechanism to show messages-->
		<#list screen.getMessages() as message>
			<#if message.success>
		<p class="successmessage">${message.text}</p>
			<#else>
		<p class="errormessage">${message.text}</p>
			</#if>
		</#list>
		
		<#-- Hack to immediatly clear the message so it doesn't "stick". -->
		${screen.clearMessage()}
		
		<div class="screenbody">
			<div class="screenpadding">	
<#--begin your plugin-->

<#if !model.getWhichScreen()?exists || model.getWhichScreen() == "one">
<table>
		<tr>
			<td ${center} ${styleWhite}>
				<label><h1>Data import wizard</h></label>
			</td>
		</tr>
		<tr>
			<td ${styleWhite}>
				<i>Upload Excel file with your data</i>
				<br />
				<input type="file" name="upload"/>
				<input type="submit" value="Upload" onclick="__action.value='upload';return true;"/><br />
			</td>
		</tr>
		
		
</table>



<#elseif model.getWhichScreen() == "two">

<h1>Import prognosis</h1>

<h3>Sheets</h3>
<table>
	<tr>
		<td ${style1}>Sheet name</td>
		<td ${style1}>Importable?</td>
	</tr>
	
	<#list model.iwep.sheetsImportable?keys as sheet>
	<tr>
		<td ${style2}>${sheet}</td>
		<td ${style2}><#if model.iwep.sheetsImportable[sheet] == true><p class="successmessage">Yes</p><#else><p class="errormessage">No</p></#if></td>
	</tr>
	</#list>

</table>

<h3>Fields of importable sheets</h3>
<table>
	<tr>
		<td ${style1}>Import order</td>
		<td ${style1}>Sheet name</td>
		<td ${style1}>Importable fields</td>
		<td ${style1}>Unknown fields</td>
	</tr>
<#assign count = 1>
<#list model.iwep.importOrder as sheet>
	<tr>
		<td ${style2}>${count}</td>
		<td ${style2}>${sheet}</td>
		
		<td ${style2}><#if model.iwep.fieldsImportable[sheet]?size gt 0><#list model.iwep.fieldsImportable[sheet] as field>${greenBg}${field}${endFont}<#if field_has_next>, </#if></#list><#else><p class="errormessage">No importable fields</p></#if></td>
		
		<td ${style2}><#if model.iwep.fieldsUnknown[sheet]?size gt 0><#list model.iwep.fieldsUnknown[sheet] as field>${redBg}${field}${endFont}<#if field_has_next>, </#if></#list><#else><p class="successmessage">No unknown fields</p></#if></td>
	</tr>
<#assign count = count+1>
</#list>
</table>

<br />
Unknown sheets and fields will be ignored during the import. If the current prognosis is not to your liking, please update your Excel file and upload it again.
<br /><br />

<table>
	<tr>
		<td ${styleWhite} align="left">
			<i>Select new file</i> <input type="submit" value="Previous" onclick="document.forms.${screen.name}.__action.value = 'toScreenOne'; document.forms.${screen.name}.submit();"/>
		</td>
		<td align="right" ${styleWhite}>
			<i>Done?</i> <input type="submit" value="Import" onclick="document.forms.${screen.name}.__action.value = 'import'; document.forms.${screen.name}.submit();"/>
		</td>
	</tr>
</table>


<#elseif model.getWhichScreen() == "three">

<br />
<#if model.importSuccess>
<p class="successmessage">Your import was successful.</p>
<#else>
Your import failed. See the above message for details. Please go back to the first screen and upload a new file.
</#if>
<br /><br />
<table>
	<tr>
		<td ${styleWhite} align="left">
			<i>Select new file</i> <input type="submit" value="Reset" onclick="document.forms.${screen.name}.__action.value = 'toScreenOne'; document.forms.${screen.name}.submit();"/>
		</td>
	</tr>
</table>

<#else>
	<table>
		<tr>
			<td>
				<font style="color: #FFFFFF;"><b>Error: No screen specified.</b></font>
			</td>
		</tr>
		<tr>
			<td align="left">
				<i>Return to first screen</i> <input type="submit" value="Previous" onclick="document.forms.${screen.name}.__action.value = 'toScreenOne'; document.forms.${screen.name}.submit();"/>
			</td>
		</tr>
	</table>
</#if>


<#--end of your plugin-->	
			</div>
		</div>
	</div>
</form>
</#macro>
