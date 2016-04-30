package com.neu.mymatchFinder;

import javax.servlet.http.HttpServletResponse;
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

@RequestMapping(value ="/deletecategory")
@Controller
public class DeleteCategoryFormController
{
	@Autowired
	CategoryDAO categoryDao;		
	
	@RequestMapping(method = RequestMethod.POST)
    protected String deleteCategory(@ModelAttribute("category")Category category,BindingResult result,HttpSession session,HttpServletResponse response) throws Exception
    {	
		System.out.println("In delete");
		if(result.hasErrors())
		{
			return "addCategoryForm";
		}
        
        try
        {           
            categoryDao.delete(category);      
            response.getWriter().println("success");
        }
        catch (AdException e)
        {
            System.out.println(e.getMessage());
        }
        return null;
    }
	
	
	@RequestMapping(method = RequestMethod.GET)
    protected String deleteCategoryrefresh(@ModelAttribute("category")Category category,BindingResult result,HttpSession session,HttpServletResponse response) throws Exception
    {	
		return "addCategoryForm";
		
    }
    
	
}