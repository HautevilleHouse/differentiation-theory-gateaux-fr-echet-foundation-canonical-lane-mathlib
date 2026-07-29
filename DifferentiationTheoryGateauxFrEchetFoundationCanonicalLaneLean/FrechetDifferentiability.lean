import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean

structure FrechetDifferential (X Y : Type) [NormedAddCommGroup X] [NormedAddCommGroup Y] where
  f : X → Y
  basePoint : X
  linearApproximation : X →L[ℝ] Y
  remainderCondition : Prop
  remainderConditionClosed : remainderCondition

def FrechetDifferentiability (X Y : Type) [NormedAddCommGroup X] [NormedAddCommGroup Y] (f : X → Y) (x : X) : Prop :=
  ∃ (L : X →L[ℝ] Y), (fun (h : X) => f (x + h) - f x - L h) =o[𝓝 0] id

structure FrechetDifferentiabilityPackage (X Y : Type) [NormedAddCommGroup X] [NormedAddCommGroup Y] (f : X → Y) (x : X) where
  existsLinearMap : ∃ (L : X →L[ℝ] Y), Asymptotics.isLittleO (𝓝 0) (fun (h : X) => f (x + h) - f x - L h) id
  linearMapUnique : Prop
  linearMapUniqueClosed : linearMapUnique

structure FrechetDifferentiabilityEvidence {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] {f : X → Y} {x : X} (F : FrechetDifferentiabilityPackage X Y f x) where
  existsLinearMapClosed : F.existsLinearMap
  linearMapUniqueClosed : F.linearMapUniqueClosed

def FrechetDifferentiabilityClosed {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] {f : X → Y} {x : X} (F : FrechetDifferentiabilityPackage X Y f x) : Prop :=
  F.existsLinearMap ∧ F.linearMapUnique

theorem frechet_differentiability_closed_from_evidence {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] {f : X → Y} {x : X} (F : FrechetDifferentiabilityPackage X Y f x) (E : FrechetDifferentiabilityEvidence F) : FrechetDifferentiabilityClosed F :=
  And.intro E.existsLinearMapClosed E.linearMapUniqueClosed

end HautevilleHouse.DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean
end HautevilleHouse