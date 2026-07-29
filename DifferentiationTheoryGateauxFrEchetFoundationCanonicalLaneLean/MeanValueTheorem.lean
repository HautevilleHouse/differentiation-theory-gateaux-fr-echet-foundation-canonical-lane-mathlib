import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean.GateauxDifferentiability
import HautevilleHouse.DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean.FrechetDifferentiability

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean

structure MeanValueTheorem (X Y : Type) [NormedAddCommGroup X] [NormedAddCommGroup Y] [NormedSpace ℝ Y] (f : X → Y) (a b : X) where
  differentiableOnPath : ∀ t ∈ Set.Ioo (0 : ℝ) 1, GateauxDifferentiability X Y f (a + t • (b - a))
  bound : ∃ M : ℝ, (∀ t ∈ Set.Ioo (0 : ℝ) 1, ‖derivative f (a + t • (b - a))‖ ≤ M) ∧ ‖f b - f a‖ ≤ M * ‖b - a‖
  boundClosed : bound

structure MeanValueTheoremPackage (X Y : Type) [NormedAddCommGroup X] [NormedAddCommGroup Y] [NormedSpace ℝ Y] (f : X → Y) (a b : X) where
  convexDomain : Convex ℝ (Set.univ : Set X)
  differentiableOnConvex : DifferentiableOn ℝ f (Set.univ : Set X)
  inequality : ‖f b - f a‖ ≤ (⨆ x ∈ Set.Ioo (0 : ℝ) 1, ‖derivative f (a + t • (b - a))‖) * ‖b - a‖
  inequalityClosed : inequality

structure MeanValueTheoremEvidence {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] [NormedSpace ℝ Y] {f : X → Y} {a b : X} (M : MeanValueTheoremPackage X Y f a b) where
  differentiableOnConvexClosed : M.differentiableOnConvex
  inequalityClosed : M.inequalityClosed

def MeanValueTheoremClosed {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] [NormedSpace ℝ Y] {f : X → Y} {a b : X} (M : MeanValueTheoremPackage X Y f a b) : Prop :=
  M.convexDomain ∧ M.differentiableOnConvex ∧ M.inequality

theorem mean_value_theorem_closed_from_evidence {X Y : Type} [NormedAddCommGroup X] [NormedAddCommGroup Y] [NormedSpace ℝ Y] {f : X → Y} {a b : X} (M : MeanValueTheoremPackage X Y f a b) (E : MeanValueTheoremEvidence M) : MeanValueTheoremClosed M :=
  And.intro M.convexDomain (And.intro E.differentiableOnConvexClosed E.inequalityClosed)

end HautevilleHouse.DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean
end HautevilleHouse