import "./index.css"

export default class CustomToast {
    static showToast(message, duration, type) {
        const toastContainer = document.createElement("div")
        toastContainer.classList.add("toast-container")
        toastContainer.style.backgroundColor = this.getColor(type)
        document.body.appendChild(toastContainer)

        const toast = document.createElement("div")
        toast.classList.add("toast")
        toast.textContent = message

        toastContainer.appendChild(toast)
        toastContainer.style.display = "block"

        setTimeout(() => {
            toastContainer.removeChild(toast)
            if (toastContainer.childElementCount === 0) {
                toastContainer.style.display = "none"
            }
        }, duration)
    }

    static getColor(type) {
        switch (type) {
            case "Error":
                return "var(--bs-warning)"
            case "Info":
                return "var(--bs-info)"
            default:
                return "var(--bs-success)"
        }
    }
}
