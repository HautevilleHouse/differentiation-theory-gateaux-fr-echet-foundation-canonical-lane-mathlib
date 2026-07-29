import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean

structure DirectionalDerivativePackage where
  domain : Type u
  codomain : Type v
  [normedDomain : NormedAddCommGroup domain]
  [normedCodomain : NormedAddCommGroup codomain]
  point : domain
  direction : domain
  limitExists : Prop
  linearInDirection : Prop
  homogeneous : Prop

structure DirectionalDerivativeEvidence (D : DirectionalDerivativePackage) where
  limitExistsClosed : D.limitExists
  linearInDirectionClosed : D.linearInDirection
  homogeneousClosed : D.homogeneous

def DirectionalDerivativeClosed (D : DirectionalDerivativePackage) : Prop :=
  D.limitExists ∧ D.linearInDirection ∧ D.homogeneous

theorem directional_derivative_closed_from_evidence (D : DirectionalDerivativePackage)
    (E : DirectionalDerivativeEvidence D) : DirectionalDerivativeClosed D := by
  exact And.intro E.limitExistsClosed (And.intro E.linearInDirectionClosed E.homogeneousClosed)

end DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean
end HautevilleHouse
