// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.disid.proofs.web;

import com.disid.proofs.domain.Menu;
import com.disid.proofs.service.api.MenuService;
import com.disid.proofs.web.MenusItemThymeleafController;
import com.disid.proofs.web.MenusItemThymeleafLinkFactory;
import io.springlets.web.NotFoundException;
import io.springlets.web.mvc.util.ControllerMethodLinkBuilderFactory;
import io.springlets.web.mvc.util.MethodLinkBuilderFactory;
import java.util.Locale;
import javax.validation.Valid;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponents;

privileged aspect MenusItemThymeleafController_Roo_Thymeleaf {
    
    declare @type: MenusItemThymeleafController: @Controller;
    
    declare @type: MenusItemThymeleafController: @RequestMapping(value = "/menus/{menu}", name = "MenusItemThymeleafController", produces = MediaType.TEXT_HTML_VALUE);
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MessageSource MenusItemThymeleafController.messageSource;
    
    /**
     * TODO Auto-generated attribute documentation
     * 
     */
    private MethodLinkBuilderFactory<MenusItemThymeleafController> MenusItemThymeleafController.itemLink;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     * @param menuService
     * @param messageSource
     * @param linkBuilder
     */
    @Autowired
    public MenusItemThymeleafController.new(MenuService menuService, MessageSource messageSource, ControllerMethodLinkBuilderFactory linkBuilder) {
        setMenuService(menuService);
        setMessageSource(messageSource);
        setItemLink(linkBuilder.of(MenusItemThymeleafController.class));
    }

    /**
     * TODO Auto-generated method documentation
     * 
     * @return MessageSource
     */
    public MessageSource MenusItemThymeleafController.getMessageSource() {
        return messageSource;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param messageSource
     */
    public void MenusItemThymeleafController.setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @return MethodLinkBuilderFactory
     */
    public MethodLinkBuilderFactory<MenusItemThymeleafController> MenusItemThymeleafController.getItemLink() {
        return itemLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param itemLink
     */
    public void MenusItemThymeleafController.setItemLink(MethodLinkBuilderFactory<MenusItemThymeleafController> itemLink) {
        this.itemLink = itemLink;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param id
     * @param locale
     * @param method
     * @return Menu
     */
    @ModelAttribute
    public Menu MenusItemThymeleafController.getMenu(@PathVariable("menu") Long id, Locale locale, HttpMethod method) {
        Menu menu = null;
        if (HttpMethod.PUT.equals(method)) {
            menu = menuService.findOneForUpdate(id);
        } else {
            menu = menuService.findOne(id);
        }
        
        if (menu == null) {
            String message = messageSource.getMessage("error_NotFound", new Object[] {"Menu", id}, "The record couldn't be found", locale);
            throw new NotFoundException(message);
        }
        return menu;
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param menu
     * @param model
     * @return ModelAndView
     */
    @GetMapping(name = "show")
    public ModelAndView MenusItemThymeleafController.show(@ModelAttribute Menu menu, Model model) {
        model.addAttribute("menu", menu);
        return new ModelAndView("menus/show");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param menu
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/inline", name = "showInline")
    public ModelAndView MenusItemThymeleafController.showInline(@ModelAttribute Menu menu, Model model) {
        model.addAttribute("menu", menu);
        return new ModelAndView("menus/showInline :: inline-content");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param dataBinder
     */
    @InitBinder("menu")
    public void MenusItemThymeleafController.initMenuBinder(WebDataBinder dataBinder) {
        dataBinder.setDisallowedFields("id");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void MenusItemThymeleafController.populateFormats(Model model) {
        model.addAttribute("application_locale", LocaleContextHolder.getLocale().getLanguage());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param model
     */
    public void MenusItemThymeleafController.populateForm(Model model) {
        populateFormats(model);
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param menu
     * @param model
     * @return ModelAndView
     */
    @GetMapping(value = "/edit-form", name = "editForm")
    public ModelAndView MenusItemThymeleafController.editForm(@ModelAttribute Menu menu, Model model) {
        populateForm(model);
        
        model.addAttribute("menu", menu);
        return new ModelAndView("menus/edit");
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param menu
     * @param version
     * @param concurrencyControl
     * @param result
     * @param model
     * @return ModelAndView
     */
    @PutMapping(name = "update")
    public ModelAndView MenusItemThymeleafController.update(@Valid @ModelAttribute Menu menu, @RequestParam("version") Integer version, @RequestParam(value = "concurrency", required = false, defaultValue = "") String concurrencyControl, BindingResult result, Model model) {
        // Check if provided form contain errors
        if (result.hasErrors()) {
            populateForm(model);
            
            return new ModelAndView("menus/edit");
        }
        // Concurrency control
        Menu existingMenu = getMenuService().findOne(menu.getId());
        if(menu.getVersion() != existingMenu.getVersion() && StringUtils.isEmpty(concurrencyControl)){
            populateForm(model);
            model.addAttribute("menu", menu);
            model.addAttribute("concurrency", true);
            return new ModelAndView("menus/edit");
        } else if(menu.getVersion() != existingMenu.getVersion() && "discard".equals(concurrencyControl)){
            populateForm(model);
            model.addAttribute("menu", existingMenu);
            model.addAttribute("concurrency", false);
            return new ModelAndView("menus/edit");
        } else if(menu.getVersion() != existingMenu.getVersion() && "apply".equals(concurrencyControl)){
            // Update the version field to be able to override the existing values
            menu.setVersion(existingMenu.getVersion());
        }
        Menu savedMenu = getMenuService().save(menu);
        UriComponents showURI = getItemLink().to(MenusItemThymeleafLinkFactory.SHOW).with("menu", savedMenu.getId()).toUri();
        return new ModelAndView("redirect:" + showURI.toUriString());
    }
    
    /**
     * TODO Auto-generated method documentation
     * 
     * @param menu
     * @return ResponseEntity
     */
    @ResponseBody
    @DeleteMapping(name = "delete")
    public ResponseEntity<?> MenusItemThymeleafController.delete(@ModelAttribute Menu menu) {
        getMenuService().delete(menu);
        return ResponseEntity.ok().build();
    }
    
}
