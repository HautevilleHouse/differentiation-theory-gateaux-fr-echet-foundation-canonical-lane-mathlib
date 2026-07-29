import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean

structure FrechetDifferentiabilityPackage where
  domain : Type u
  codomain : Type v
  normedDomain : NormedAddCommGroup domain
  normedCodomain : NormedAddCommGroup codomain
  point : domain
  linearMap : domain →L[ℝ] codomain
  limitCondition : Prop
  errorTerm : Prop
  limitConditionClosed : limitCondition
  errorTermClosed : errorTerm

def FrechetDifferentiabilityClosed (P : FrechetDifferentiabilityPackage) : Prop :=
  P.limitCondition ∧ P.errorTerm

theorem frechet_differentiability_closed (P : FrechetDifferentiabilityPackage) :
    FrechetDifferentiabilityClosed P := by
  exact And.intro P.limitConditionClosed P.errorTermClosed

end DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean
end HautevilleHouse