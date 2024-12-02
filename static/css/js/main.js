document.addEventListener('DOMContentLoaded', () => {
    // Animacja ładowania kwiatów
    const flowerCards = document.querySelectorAll('.flower-card');
    flowerCards.forEach((card, index) => {
        setTimeout(() => {
            card.classList.add('visible');
        }, index * 100); // Opóźnienie w kolejności
    });

    // Przejście widoku
    const viewSwitchLinks = document.querySelectorAll('.view-switch a');
    viewSwitchLinks.forEach(link => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            document.querySelector('.flowers').className = `flowers ${link.getAttribute('href').replace('?view=', '')}`;
        });
    });
});
document.addEventListener("DOMContentLoaded", () => {
    console.log("JS loaded!");
});


