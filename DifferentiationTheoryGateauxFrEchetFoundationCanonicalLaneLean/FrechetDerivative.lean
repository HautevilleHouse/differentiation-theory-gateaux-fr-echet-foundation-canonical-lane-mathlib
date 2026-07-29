import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean

structure FrechetDerivativePackage (M N : Type u) [NormedAddCommGroup M] [NormedAddCommGroup N] where
  totalDerivative : (M → N) → M → (M →L[ℝ] N)
  boundedLinearMap : Prop
  approximationProperty : Prop
  boundedLinearMapTerm : boundedLinearMap
  approximationPropertyTerm : approximationProperty

structure FrechetDerivativeEvidence {M N : Type u} [NormedAddCommGroup M] [NormedAddCommGroup N]
    (P : FrechetDerivativePackage M N) where
  boundedLinearMapClosed : P.boundedLinearMap
  approximationPropertyClosed : P.approximationProperty

def FrechetDerivativeClosed {M N : Type u} [NormedAddCommGroup M] [NormedAddCommGroup N]
    (P : FrechetDerivativePackage M N) : Prop :=
  P.boundedLinearMap ∧ P.approximationProperty

theorem frechet_derivative_closed_from_evidence
    {M N : Type u} [NormedAddCommGroup M] [NormedAddCommGroup N]
    (P : FrechetDerivativePackage M N) (E : FrechetDerivativeEvidence P) :
    FrechetDerivativeClosed P := by
  exact And.intro E.boundedLinearMapClosed E.approximationPropertyClosed

end HautevilleHouse.DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean
end HautevilleHouse