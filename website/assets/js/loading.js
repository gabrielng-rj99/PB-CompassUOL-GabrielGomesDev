document.addEventListener("DOMContentLoaded", function() {
  window.onload = function() {
    // Ocultar a tela de loading
    const loadingScreen = document.getElementById("loading-screen");
    loadingScreen.classList.add("hidden");

    // Remover a tela de loading após a transição
    loadingScreen.addEventListener("transitionend", function() {
      // Mostrar o conteúdo principal
      const content = document.getElementById("content");
      content.style.display = "block";  // Mostra o conteúdo
    });
  };
});
