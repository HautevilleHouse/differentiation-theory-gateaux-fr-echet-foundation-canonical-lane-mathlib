import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean.GateauxDerivative
import HautevilleHouse.DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean.FrechetDerivative

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean

def ConstrainedDifferentiationClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_differentiation_endgame (A : AdmissibleClass) :
    ConstrainedDifferentiationClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end HautevilleHouse.DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean
end HautevilleHouse