// app.js
const express = require('express');
const app = express();
const port = 3000;

// Route pour retourner des données statiques
app.get('/api/data', (req, res) => {
  res.json({ message: "Données statiques de l'API" });
});

// Démarrer l'application
app.listen(port, () => {
  console.log(`API en écoute sur http://localhost:${port}`);
});
