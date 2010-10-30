<#--Date:        November 11, 2009
 * Template:	PluginScreenFTLTemplateGen.ftl.ftl
 * generator:   org.molgenis.generators.ui.PluginScreenFTLTemplateGen 3.3.2-testing
 * 
 * THIS FILE IS A TEMPLATE. PLEASE EDIT :-)
-->
<#macro plugins_header_MolgenisHeader screen>
<div id="header">	
	<p>
		<a href="http://www.molgenis.org">
			<img src="generated-res/img/logo_molgenis.gif" height="70px" align="right"/>
		</a>
		&nbsp;${application.getLabel()}
	</p>
</div>
<div align="right" style="color: maroon; font: 12px Arial;margin-right: 10px;"><a href="about.html">About</a>  | <a href="generated-doc/objectmodel.html">Data model</a>  | <a href="generated-doc/fileformat.html">File format</a> | <a href="api/R">R-interface</a> | <a href="api/find">HTTP</a> | <a href="api/rest/?_wadl">REST</a> | <a href="api/soap?wsdl">SOAP</a> | <a href="rdf.html">RDF</a>.</div>
</#macro>
