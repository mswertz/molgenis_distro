package commands;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.List;

import org.molgenis.framework.db.Database;
import org.molgenis.framework.db.DatabaseException;
import org.molgenis.framework.ui.ScreenController;
import org.molgenis.framework.ui.ScreenModel;
import org.molgenis.framework.ui.commands.AddCommand;
import org.molgenis.framework.ui.html.HtmlInput;
import org.molgenis.util.Tuple;

/**
 * Customized version of the 'Add' command.
 */
public class TestMrefChangeCommand extends AddCommand
{
	public TestMrefChangeCommand(ScreenController<?> s)
	{
		//create new method
		super("change_mref_automatically", s);
		this.setLabel("Change MREF without touching it");
	}

	@Override
	public List<HtmlInput<?>> getInputs() throws DatabaseException
	{
		//not used
		return null;
	}
	
	@Override
	public List<HtmlInput> getActions()
	{
		//not used
		return null;
	}
	
	@Override
	public ScreenModel.Show handleRequest(Database db, Tuple request, PrintWriter downloadStream) throws ParseException, DatabaseException, IOException
	{
		//not used
		return null;
	}
	
	public String getJavaScriptAction()
	{
		//create a new option and set it
		return "if(document.getElementById('AggregateData_form').samples.options) {" +
				"document.getElementById('AggregateData_form').samples.options[0].value = 1; " +
				"document.getElementById('AggregateData_form').samples.options[0].text = 'helloworld';" +
				"} else {" +
				"document.getElementById('AggregateData_form').samples[0].options[0].value = 1; " +
				"document.getElementById('AggregateData_form').samples[0].options[0].text = 'helloworld';" +
				"}";
	}
}
