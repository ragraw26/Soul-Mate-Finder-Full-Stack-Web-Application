package com.neu.mymatchFinder;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.neu.mymatchFinder.dao.CategoryDAO;
import com.neu.mymatchFinder.exception.AdException;
import com.neu.mymatchFinder.pojo.Category;

@RequestMapping(value = "/addcategory")
@Controller
public class AddCategoryFormController
{
	@Autowired
	CategoryDAO categoryDao;	
	
	@RequestMapping(method = RequestMethod.POST)
    protected String doSubmitAction(@ModelAttribute("category")Category category,BindingResult result,HttpSession session) throws Exception
    {		
		if(result.hasErrors())
		{
			return "addCategoryForm";
		}
        
        try
        {           
            categoryDao.create(category.getTitle());
            java.util.List categoryList = categoryDao.list();
            session.setAttribute("categories", categoryList);
            session.setAttribute("category", category);
            
        }
        catch (AdException e)
        {
            System.out.println(e.getMessage());
        }
        return "addCategoryForm";
    }
	
	    
	@RequestMapping(method=RequestMethod.GET)
    public String initializeForm(@ModelAttribute("category")Category category, BindingResult result) { 
   
        return "addCategoryForm"; 
    } 
}