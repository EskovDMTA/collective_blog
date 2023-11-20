// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap";
import CustomToast from "./components/toast";

document.addEventListener('DOMContentLoaded', function () {
    const notice = document.querySelector('[name="notice"]').value;
    console.log(notice)
    console.log("NOTICE")
    if (notice) {
        console.log("NOTICE")
        CustomToast.showToast(notice, 3000, "Info");
    }
});
