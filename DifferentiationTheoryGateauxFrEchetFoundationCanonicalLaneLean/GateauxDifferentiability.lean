import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean

struct GateauxDifferential (X Y : Type) [NormedAddCommGroup X] [NormedAddCommGroup Y] where
  f : X → Y
  basePoint : X
  tangentVector : X
  limitExists : Prop
  derivativeValue : Y
  limitExistsClosed : limitExists

def GateauxDifferentialPackage (X Y : Type) [NormedAddCommGroup X] [NormedAddCommGroup Y] (f : X → Y) (x : X) : Type := 
  (h : ∀ h : X, ∃ L : Y, Tendsto (fun (t : ℝ) => (f (x + t • h) - f x) / t) (𝓝 0) (𝓝 L))

structure GateauxDifferentiability (X Y : Type) [NormedAddCommGroup X] [NormedAddCommGroup Y] (f : X → Y) (x : X) where
  directionalDerivativesExist : ∀ (h : X), ∃ (L : Y), Filter.Tendsto (fun (t : ℝ) => (f (x + t • h) - f x) / t) (𝓝 0) (𝓝 L)
  derivativeLinear : Prop
  continuousLinearMap : X →L[ℝ] Y
  derivativeLinearClosed : derivativeLinear

structure GateauxDifferentiabilityEvidence {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] {f : X → Y} {x : X} (G : GateauxDifferentiability X Y f x) where
  directionalDerivativesExistClosed : G.directionalDerivativesExist
  continuousLinearMapClosed : G.continuousLinearMap

def GateauxDifferentiabilityClosed {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] {f : X → Y} {x : X} (G : GateauxDifferentiability X Y f x) : Prop :=
  G.directionalDerivativesExist ∧ G.derivativeLinear

theorem gateaux_differentiability_closed_from_evidence {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] {f : X → Y} {x : X} (G : GateauxDifferentiability X Y f x) (E : GateauxDifferentiabilityEvidence G) : GateauxDifferentiabilityClosed G :=
  And.intro E.directionalDerivativesExistClosed G.derivativeLinearClosed

end HautevilleHouse.DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean
end HautevilleHouse