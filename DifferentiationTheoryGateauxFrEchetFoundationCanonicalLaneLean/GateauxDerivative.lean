import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean

structure GateauxDerivativePackage (M N : Type u) [NormedAddCommGroup M] [NormedAddCommGroup N] where
  directionSet : Set M
  directionalLimit : (M → N) → M → M → N
  linearityOnDirection : Prop
  boundednessOnDirection : Prop
  linearityOnDirectionTerm : linearityOnDirection
  boundednessOnDirectionTerm : boundednessOnDirection

structure GateauxDerivativeEvidence {M N : Type u} [NormedAddCommGroup M] [NormedAddCommGroup N]
    (P : GateauxDerivativePackage M N) where
  linearityOnDirectionClosed : P.linearityOnDirection
  boundednessOnDirectionClosed : P.boundednessOnDirection

def GateauxDerivativeClosed {M N : Type u} [NormedAddCommGroup M] [NormedAddCommGroup N]
    (P : GateauxDerivativePackage M N) : Prop :=
  P.linearityOnDirection ∧ P.boundednessOnDirection

theorem gateaux_derivative_closed_from_evidence
    {M N : Type u} [NormedAddCommGroup M] [NormedAddCommGroup N]
    (P : GateauxDerivativePackage M N) (E : GateauxDerivativeEvidence P) :
    GateauxDerivativeClosed P := by
  exact And.intro E.linearityOnDirectionClosed E.boundednessOnDirectionClosed

end HautevilleHouse.DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean
end HautevilleHouse