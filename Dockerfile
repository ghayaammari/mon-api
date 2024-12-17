# Étape 1: Utiliser l'image officielle de Node.js
FROM node:14

# Étape 2: Créer un répertoire de travail dans le conteneur
WORKDIR /usr/src/app

# Étape 3: Copier les fichiers package.json et package-lock.json dans le conteneur
COPY package*.json ./

# Étape 4: Installer les dépendances
RUN npm install

# Étape 5: Copier tout le reste du code dans le conteneur
COPY . .

# Étape 6: Exposer le port que l'API utilise
EXPOSE 3000

# Étape 7: Lancer l'application lorsque le conteneur démarre
CMD ["node", "app.js"]
