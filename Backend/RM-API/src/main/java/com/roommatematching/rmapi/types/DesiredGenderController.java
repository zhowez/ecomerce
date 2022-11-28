package com.roommatematching.rmapi.types;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(path="/api/types/gender")
public class DesiredGenderController {
    private final DesiredGenderRepository DesiredGenderRepo;

    @Autowired
    public DesiredGenderController(DesiredGenderRepository DesiredGenderRepo) {
        this.DesiredGenderRepo = DesiredGenderRepo;
    }

    @PostMapping(path="/add")
    public  @ResponseBody String addNewGender (@RequestParam String gender) {
        DesiredGender d = new DesiredGender();
        d.setGender(gender);
        DesiredGenderRepo.save(d);
        return "Saved Gender";
    }

    @GetMapping(path="/getall")
    public @ResponseBody Iterable<DesiredGender> getAllGenders() {
        return DesiredGenderRepo.findAll();
    }
}
