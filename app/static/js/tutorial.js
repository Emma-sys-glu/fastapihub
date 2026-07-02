document.addEventListener("DOMContentLoaded", () => {

    const lessons = document.querySelectorAll(".lesson-card");
    const completeButtons = document.querySelectorAll(".complete-btn");
    const progressBar = document.getElementById("progressBar");
    const levelButtons = document.querySelectorAll(".level-btn");
    const levelsScroll = document.querySelector(".levels-scroll");

    const total = lessons.length;

    let unlockedLevel = parseInt(localStorage.getItem("unlockedLevel")) || 1;
    let currentLevel = parseInt(localStorage.getItem("currentLevel")) || 1;

    if (currentLevel > unlockedLevel) {
        currentLevel = unlockedLevel;
    }

    function updateView() {

        lessons.forEach(lesson => {
            const level = parseInt(lesson.dataset.level);

            if (level === currentLevel) {
                lesson.classList.remove("d-none");
            } else {
                lesson.classList.add("d-none");
            }
        });

        levelButtons.forEach(button => {
            const level = parseInt(button.dataset.level);

            button.classList.remove(
                "active-level",
                "completed-level",
                "locked-level",
                "d-none"
            );

            if (level > unlockedLevel) {
                button.classList.add("d-none");
                button.disabled = true;
                return;
            }

            button.disabled = false;

            if (level < unlockedLevel) {
                button.classList.add("completed-level");
            }

            if (level === currentLevel) {
                button.classList.add("active-level");
            }
        });

        const completed = Math.min(unlockedLevel - 1, total);
        const percent = Math.round((completed / total) * 100);

        progressBar.style.width = percent + "%";
        progressBar.textContent = percent + "%";

        localStorage.setItem("unlockedLevel", unlockedLevel);
        localStorage.setItem("currentLevel", currentLevel);

        const activeButton = document.getElementById(`level-${currentLevel}`);

        if (activeButton && levelsScroll) {
            levelsScroll.scrollTop =
                activeButton.offsetTop - levelsScroll.offsetTop - 20;
        }
    }

    levelButtons.forEach(button => {
        button.addEventListener("click", () => {
            const level = parseInt(button.dataset.level);

            if (level <= unlockedLevel) {
                currentLevel = level;
                updateView();
            }
        });
    });

    completeButtons.forEach(button => {
        button.addEventListener("click", () => {
            const level = parseInt(button.dataset.level);

            if (level !== currentLevel) return;

            if (unlockedLevel < total) {
                unlockedLevel++;
                currentLevel = unlockedLevel;
                alert("Nivel completado. Siguiente nivel desbloqueado.");
            } else {
                alert("Curso completado.");
            }

            updateView();
        });
    });

    window.goPreviousLevel = function () {
        if (currentLevel > 1) {
            currentLevel--;
            updateView();
        }
    };

    window.goNextLevel = function () {
        if (currentLevel < unlockedLevel && currentLevel < total) {
            currentLevel++;
            updateView();
        }
    };

    updateView();

});