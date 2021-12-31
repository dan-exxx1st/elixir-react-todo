import React from "react";
import { BrowserRouter as Router, Route, Link, Routes } from "react-router-dom";

const App = () => (
  <Router>
    <header>
      <nav>
        <ul>
          <li>
            <Link to="/">Главная</Link>
          </li>
          <li>
            <Link to="/about">Контакты</Link>
          </li>
          <li>
            <Link to="/users">Пользователи</Link>
          </li>
        </ul>
      </nav>
    </header>

    <main>
      <Routes>
        <Route path="/about" element={<About />} />
        <Route path="/users" element={<Users />} />
        <Route path="/" element={<Home />} />
      </Routes>
    </main>
  </Router>
);

const Home = () => <h2>Главная</h2>;

const About = () => <h2>Контакты</h2>;

const Users = () => <h2>Пользователи</h2>;

export default App;
