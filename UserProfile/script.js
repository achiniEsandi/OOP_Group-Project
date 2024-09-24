// script.js

document.addEventListener('DOMContentLoaded', function() {
    const editButton = document.getElementById('edit-button');
    const modal = document.getElementById('edit-modal');
    const closeModal = document.getElementsByClassName('close')[0];
    const editForm = document.getElementById('edit-form');

    // Tabs and sections
    const historyTab = document.getElementById('history-tab');
    const favoritesTab = document.getElementById('favorites-tab');
    const playlistsTab = document.getElementById('playlists-tab');

    const historySection = document.getElementById('watch-history');
    const favoritesSection = document.getElementById('favorites');
    const playlistsSection = document.getElementById('playlists');

    const tabs = [historyTab, favoritesTab, playlistsTab];
    const sections = [historySection, favoritesSection, playlistsSection];

    // Tab switching
    tabs.forEach((tab, index) => {
        tab.addEventListener('click', function(event) {
            event.preventDefault();
            tabs.forEach(tab => tab.classList.remove('active'));
            sections.forEach(section => section.classList.remove('active'));
            tab.classList.add('active');
            sections[index].classList.add('active');
        });
    });

    // Open the modal when clicking the edit button
    editButton.addEventListener('click', function() {
        modal.style.display = 'block';
    });

    // Close the modal when clicking the close button or outside the modal
    closeModal.addEventListener('click', function() {
        modal.style.display = 'none';
    });

    window.addEventListener('click', function(event) {
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    });

    // Handle form submission
    editForm.addEventListener('submit', function(event) {
        event.preventDefault();

        // Get new values from the form inputs
        const newUsername = document.getElementById('edit-username').value;
        const newEmail = document.getElementById('edit-email').value;
        const newBio = document.getElementById('edit-bio').value;

        // Update the profile information on the page
        document.getElementById('username').textContent = newUsername;
        document.getElementById('email').textContent = newEmail;
        document.getElementById('bio').textContent = newBio;

        // Close the modal after saving
        modal.style.display = 'none';
    });

    // Simulated data fetching for watch history, favorites, and playlists
    const watchHistory = [
        { title: "Video 1", id: 1 },
        { title: "Video 2", id: 2 }
    ];

    const favorites = [
        { title: "Favorite Video 1", id: 3 },
        { title: "Favorite Video 2", id: 4 }
    ];

    const playlists = [
        { title: "Playlist 1", id: 5 },
        { title: "Playlist 2", id: 6 }
    ];

    // Load videos into sections
    function loadVideos(list, elementId) {
        const listElement = document.getElementById(elementId);
        list.forEach(video => {
            const div = document.createElement('div');
            div.textContent = video.title;
            listElement.appendChild(div);
        });
    }

    loadVideos(watchHistory, 'history-list');
    loadVideos(favorites, 'favorites-list');
    loadVideos(playlists, 'playlists-list');
});
