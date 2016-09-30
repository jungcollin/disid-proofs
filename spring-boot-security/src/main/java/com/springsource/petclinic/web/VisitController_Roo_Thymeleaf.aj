// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.petclinic.web;

import com.springsource.petclinic.datatables.DatatablesData;
import com.springsource.petclinic.datatables.DatatablesPageable;
import com.springsource.petclinic.domain.Visit;
import com.springsource.petclinic.repository.GlobalSearch;
import com.springsource.petclinic.web.VisitController;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

privileged aspect VisitController_Roo_Thymeleaf {
    
    @RequestMapping(method = RequestMethod.GET, produces = MediaType.TEXT_HTML_VALUE)
    public String VisitController.list(Model model) {
        return "visits/list";
    }
    
    @RequestMapping(method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Page<Visit> VisitController.list(GlobalSearch search, Pageable pageable) {
        Page<Visit> visit = visitService.findAll(search, pageable);
        return visit;
    }
    
    @RequestMapping(method = RequestMethod.GET, produces = "application/vnd.datatables+json")
    @ResponseBody
    public DatatablesData<Visit> VisitController.list(GlobalSearch search, DatatablesPageable pageable, @RequestParam("draw") Integer draw) {
        Page<Visit> visit = list(search, pageable);
        long allAvailableVisit = visitService.count();
        return new DatatablesData<Visit>(visit, allAvailableVisit, draw);
    }
    
    @RequestMapping(value = "/create-form", method = RequestMethod.GET, produces = MediaType.TEXT_HTML_VALUE)
    public String VisitController.createForm(Model model) {
        model.addAttribute(new Visit());
        populateForm(model);
        return "visits/create";
    }
    
    @RequestMapping(method = RequestMethod.POST, produces = MediaType.TEXT_HTML_VALUE)
    public String VisitController.create(@Valid @ModelAttribute Visit visit, BindingResult result, RedirectAttributes redirectAttrs, Model model) {
        if (result.hasErrors()) {
            populateForm(model);
            return "visits/create";
        }
        Visit newVisit = visitService.save(visit);
        redirectAttrs.addAttribute("id", newVisit.getId());
        return "redirect:/visits/{id}";
    }
    
    @RequestMapping(value = "/{visit}/edit-form", method = RequestMethod.GET, produces = MediaType.TEXT_HTML_VALUE)
    public String VisitController.editForm(@PathVariable("visit") Visit visit, Model model) {
        populateForm(model);
        return "visits/edit";
    }
    
    @RequestMapping(value = "/{visit}", method = RequestMethod.PUT, produces = MediaType.TEXT_HTML_VALUE)
    public String VisitController.update(@Valid @ModelAttribute Visit visit, BindingResult result, RedirectAttributes redirectAttrs, Model model) {
        if (result.hasErrors()) {
            populateForm(model);
            return "visits/edit";
        }
        Visit savedVisit = visitService.save(visit);
        redirectAttrs.addAttribute("id", savedVisit.getId());
        return "redirect:/visits/{id}";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = MediaType.TEXT_HTML_VALUE)
    public String VisitController.delete(@PathVariable("id") Long id, Model model) {
        visitService.delete(id);
        return "redirect:/visits";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity VisitController.delete(@PathVariable("id") Long id) {
        visitService.delete(id);
        return new ResponseEntity(HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{visit}", method = RequestMethod.GET, produces = MediaType.TEXT_HTML_VALUE)
    public String VisitController.show(@PathVariable("visit") Visit visit, Model model) {
        return "visits/show";
    }
    
    public void VisitController.populateForm(Model model) {
        populateFomats(model);
    }
    
    public void VisitController.populateFomats(Model model) {
        model.addAttribute("application_locale", LocaleContextHolder.getLocale().getLanguage());
        model.addAttribute("visitDate_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
}