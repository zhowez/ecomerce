package com.roommatematching.rmapi;
import com.roommatematching.rmapi.university.UniversityList;
import com.roommatematching.rmapi.university.UniversityListRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller // This means that this class is a Controller
@RequestMapping(path="/demo") // This means URL's start with /demo (after Application path)
public class AccountController {

    @Autowired
    private UniversityListRepository UniversityListRepo;

    @PostMapping(path="/add")
    public @ResponseBody String addNewUniversity (@RequestParam String uniName) {
        // @ResponseBody means the returned String is the response, not a view name
        // @RequestParam means it is a parameter from the GET or POST request

        UniversityList u = new UniversityList();
        u.setUniversityName(uniName);
        UniversityListRepo.save(u);
        return "Saved";
    }

    @GetMapping(path="/all")
    public  @ResponseBody Iterable<UniversityList> getAllUniversities() {
        return UniversityListRepo.findAll();
    }
}
