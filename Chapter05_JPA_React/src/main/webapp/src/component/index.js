import React from 'react';
import { Link } from 'react-router-dom';

const index = () => {
  return (
    <div>
      <h3>*** 메인 화면 ***</h3>
      <hr/>
      <p>
        <Link to='/user/writeForm'>입력</Link>
      </p>
      <p>
        <Link to='/user/list'>목록</Link>
      </p>
    </div>
  );
};

export default index;