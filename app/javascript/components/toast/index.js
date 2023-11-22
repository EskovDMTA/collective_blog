// flash-toast.js

export default function initializeFlashToast() {
    document.addEventListener('turbo:load', () => {
        const toast = document.querySelector(".flash-toast");
        const closeIcon = document.querySelector(".flash-close");
        const progress = document.querySelector(".flash-progress");

        let timer1, timer2;

        if (toast && closeIcon && progress && toast.innerText.length > 0) {
            toast.classList.add("active");
            progress.classList.add("active");

            timer1 = setTimeout(() => {
                toast.classList.remove("active");
            }, 5000);

            timer2 = setTimeout(() => {
                progress.classList.remove("active");
            }, 5300);

            closeIcon.addEventListener("click", () => {
                toast.classList.remove("active");

                setTimeout(() => {
                    progress.classList.remove("active");
                }, 300);

                clearTimeout(timer1);
                clearTimeout(timer2);
            });
        }
    });
}
