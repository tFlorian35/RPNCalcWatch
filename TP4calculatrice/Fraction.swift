import Foundation

class Fraction : StackRPNCompatible{
 
  
  var numerateur: Int
  var denominateur: Int
  
  var doubleValue: Double {
    get{
      if denominateur != 0 {
        return Double(numerateur)/Double(denominateur)
      }else {
        return Double.infinity
      }
    }
  }
  var stringValue: String{
    get {
      return "[\(numerateur)|\(denominateur)]"
    }
  }

  
  
  init (aNumerateur: Int, aDenominateur: Int){
    numerateur  = aNumerateur
    denominateur = aDenominateur
  }
  
  func multiplication(uneAutreFraction: Fraction){
    self.numerateur *= uneAutreFraction.numerateur
    self.denominateur *= uneAutreFraction.denominateur
  }
  
  func addition(uneAutreFraction: Fraction)
  {
    // Formule: a/b + c/d => (a*d+c*b)/(b*d)
    let e = self.denominateur*uneAutreFraction.denominateur
    self.numerateur = self.numerateur*uneAutreFraction.denominateur +
      self.denominateur*uneAutreFraction.numerateur
    self.denominateur = e
    reduction()
  }
  
  func soustraction(uneAutreFraction: Fraction)
  {
    // Formule: a/b + c/d => (a*d+c*b)/(b*d)
    let e = self.denominateur*uneAutreFraction.denominateur
    self.numerateur = self.numerateur*uneAutreFraction.denominateur -
      self.denominateur*uneAutreFraction.numerateur
    self.denominateur = e
    reduction()
  }
  
  func reduction () {
    var u = abs(numerateur)
    var v = denominateur
    var temp = 0
    if u==0
    {
      return
    }
    while  v != 0 {
      temp = u%v
      u=v
      v=temp
    }
    numerateur /= u
    denominateur /= u
  }
  
  
  
 }
