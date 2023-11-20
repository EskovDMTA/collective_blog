// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap";
import CustomToast from "./components/toast";

document.addEventListener('DOMContentLoaded', function () {
    const notice = document.querySelector(".notice");
    console.log("Проверка загрузки скрипта");
    if (notice) {
        console.log("поймали, отображаем");
        CustomToast.showToast(notice.textContent, 3000, "Info");
    }
});
