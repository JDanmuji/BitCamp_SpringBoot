import React from 'react';
import Index from './component/index.js';
import { BrowserRouter, Route, Routes } from 'react-router-dom';

const App = () => {
  return (
    <BrowserRouter>
      <>
        {/* 화면에 보이는 영역 */}
        <Routes>
          <Route path='/' element={<Index />}/>
        </Routes>
      </>
    </BrowserRouter>
  );
};

export default App;