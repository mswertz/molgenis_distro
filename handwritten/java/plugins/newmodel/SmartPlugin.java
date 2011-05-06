/* Date:        December 24, 2010
 * Template:	PluginScreenJavaTemplateGen.java.ftl
 * generator:   org.molgenis.generators.ui.PluginScreenJavaTemplateGen 3.3.3
 * 
 * THIS FILE IS A TEMPLATE. PLEASE EDIT :-)
 */

package plugins.newmodel;

import org.molgenis.framework.db.Database;
import org.molgenis.framework.ui.ScreenController;
import org.molgenis.framework.ui.html.ActionInput;
import org.molgenis.framework.ui.html.StringInput;
import org.molgenis.util.Tuple;

public class SmartPlugin extends org.molgenis.framework.ui.GenericPlugin
{
	public StringInput nameInput = new StringInput("name");
	public ActionInput helloInput = new ActionInput("setName");

	public SmartPlugin(String name, ScreenController<?> parent)
	{
		super(name, parent); 
	}
	
	/** Action setName: set name to hello */
	public void setName(Database db, Tuple request)
	{
		this.nameInput.setValue(request.getString("name"));
	}
	
	public String render()
	{
		return super.render("SmartPlugin.ftl");
	}
}
