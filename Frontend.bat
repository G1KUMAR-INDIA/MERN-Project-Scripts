#!/bin/bash

# Script to set up Vite with Tailwind CSS, React Router DOM, and Axios
echo "Starting project setup..."

mkdir client

# Navigate into the project directory

cd client

# Step 1: Create a new Vite project

npm create vite@latest . -- template react


# Step 2: Install dependencies
echo "Installing dependencies..."
npm install

# Step 3: Install Tailwind CSS and its dependencies
echo "Installing Tailwind CSS..."
npm install -D tailwindcss postcss autoprefixer

# Initialize Tailwind CSS configuration
echo "Initializing Tailwind CSS configuration..."
npx tailwindcss init

# Step 4: Configure Tailwind CSS
echo "Configuring Tailwind CSS..."
cat > ./tailwind.config.cjs <<EOL
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{js,jsx,ts,tsx}"],
  theme: {
    extend: {},
  },
  plugins: [],
};
EOL

# Add Tailwind directives to a CSS file
echo "Adding Tailwind CSS directives..."
mkdir -p src/styles
cat > ./src/styles/tailwind.css <<EOL
@tailwind base;
@tailwind components;
@tailwind utilities;
EOL

# Import Tailwind CSS into the project
echo "Importing Tailwind CSS into index.css..."
cat > ./src/index.css <<EOL
@tailwind base;
@tailwind components;
@tailwind utilities;
EOL

# Modify main entry point to include the index.css file
sed -i '1s/^/import ".\/index.css";\n/' ./src/main.jsx

# Step 5: Install React Router DOM and Axios
echo "Installing React Router DOM and Axios..."
npm install react-router-dom axios

# Step 6: Create basic React Router setup
echo "Setting up basic routing..."
mkdir -p src/pages
cat > ./src/pages/Home.jsx <<EOL
import React from "react";

const Home = () => {
    return <h1>Welcome to the Home Page!</h1>;
};

export default Home;
EOL

cat > ./src/pages/About.jsx <<EOL
import React from "react";

const About = () => {
    return <h1>About Us</h1>;
};

export default About;
EOL

mkdir -p src/components
cat > ./src/components/Navbar.jsx <<EOL
import React from "react";
import { Link } from "react-router-dom";

const Navbar = () => {
    return (
        <nav>
            <ul>
                <li><Link to="/">Home</Link></li>
                <li><Link to="/about">About</Link></li>
            </ul>
        </nav>
    );
};

export default Navbar;
EOL

cat > ./src/App.jsx <<EOL
import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Navbar from "./components/Navbar";
import Home from "./pages/Home";
import About from "./pages/About";

const App = () => {
    return (
        <Router>
            <Navbar />
            <Routes>
                <Route path="/" element={<Home />} />
                <Route path="/about" element={<About />} />
            </Routes>
        </Router>
    );
};

export default App;
EOL

# Modify main.jsx to use the App component
echo "Configuring main.jsx..."
cat > ./src/main.jsx <<EOL
import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App";
import "./index.css";

ReactDOM.createRoot(document.getElementById("root")).render(
    <React.StrictMode>
        <App />
    </React.StrictMode>
);
EOL

# Step 7: Final Instructions
echo "Setup complete!"
echo "Navigate to your project directory:"
echo "  cd ."
echo "Start the development server:"
echo "  npm run dev"
