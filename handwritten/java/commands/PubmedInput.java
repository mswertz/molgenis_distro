package commands;

import org.molgenis.framework.ui.html.StringInput;

public class PubmedInput extends StringInput
{

	public PubmedInput(String name)
	{
		super(name);
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toHtml()
	{
		//this needs to be something custom with javascript 
		//e.g. a button retrieve pubmed and update abstract field
		return "<script>//todo</script>"+
			super.toHtml()
			+"<input type=\"submit\" onclick=\"alert('TODO'); return false;\" value=\"get pubmed abstract\"/>";
	}
	
	

}
