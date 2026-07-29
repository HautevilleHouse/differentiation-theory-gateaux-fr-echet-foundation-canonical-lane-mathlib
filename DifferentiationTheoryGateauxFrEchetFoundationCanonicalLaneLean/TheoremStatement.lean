import Mathlib.Analysis.Calculus.FDeriv.Basic

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean

structure DifferentiableSpace where
  carrier : Type
  norm : carrier → ℝ
  isBanach : Prop

structure DifferentiableAdmittedObject where
  space : DifferentiableSpace
  gateauxDifferentiable : Prop
  frechetDifferentiable : Prop
  conclusion : frechetDifferentiable

def DifferentiableWitnessClosed (O : DifferentiableAdmittedObject) : Prop :=
  O.frechetDifferentible

end DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean
end HautevilleHouse