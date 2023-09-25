import "./App.css";
import { Suspense, useState, useEffect, useRef } from "react";
import { Canvas, useLoader, useFrame } from "@react-three/fiber";
import {
  OrbitControls,
  OrthographicCamera,
  SpotLight,
} from "@react-three/drei";
import Map from "/src/Map";
import Characters from "/src/Characters";

import Controller from "/src/Controller";

// import Portforlio from "./Components/Common/Portfolio";
import NewsBar from "./Components/Common/NewsBar";

import "./App.css";
import Modals from "./Modals";
import PlayerPlaceAll from "./Components/Common/PlayerPlaceAll";
import SideBar from "./Components/Common/SideBar";

// import ChatTest from "./Socket";

function App() {
  return (
    <div
      className="canvas-outer"
      style={{ width: "100%", height: "calc(100vw * 9 / 16)" }}
    >
      <Canvas style={{ width: "100%", height: "100%" }}>
        <OrthographicCamera makeDefault zoom={65} position={[4, 4.1, 4]} />
        <OrbitControls />
        <ambientLight intensity={3} />
        {/* <directionalLight intensity={5} /> */}

        <Map />
        <Characters />
      </Canvas>

      {/* <Dice2 /> */}
      <Controller />

      <NewsBar />
      <PlayerPlaceAll />
      <SideBar />

      <Modals />
      {/* <ChatTest /> */}
    </div>
  );
}

export default App;
