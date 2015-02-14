function object(o) {
  function F() {}
  F.prototype = o;
  return new F();
}