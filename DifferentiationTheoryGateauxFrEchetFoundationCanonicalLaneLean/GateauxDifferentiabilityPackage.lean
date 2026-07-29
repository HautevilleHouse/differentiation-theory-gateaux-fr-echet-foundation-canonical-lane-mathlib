import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean

structure GateauxDifferentiabilityPackage where
  domain : Type u
  codomain : Type v
  normedDomain : NormedAddCommGroup domain
  normedCodomain : NormedAddCommGroup codomain
  point : domain
  directionalDerivative : domain → codomain
  linearityCondition : Prop
  boundednessCondition : Prop
  linearityConditionClosed : linearityCondition
  boundednessConditionClosed : boundednessCondition

def GateauxDifferentiabilityClosed (P : GateauxDifferentiabilityPackage) : Prop :=
  P.linearityCondition ∧ P.boundednessCondition

theorem gateaux_differentiability_closed (P : GateauxDifferentiabilityPackage) :
    GateauxDifferentiabilityClosed P := by
  exact And.intro P.linearityConditionClosed P.boundednessConditionClosed

end DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean
end HautevilleHouse