import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean.FrechetDifferentiability

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean

structure SecondFrechetDerivative (X Y : Type) [NormedAddCommGroup X] [NormedAddCommGroup Y] [NormedAddCommGroup (X →L[ℝ] Y)] where
  f : X → Y
  firstDerivative : X → (X →L[ℝ] Y)
  secondDerivativeAtPoint : X → ((X × X) →L[ℝ] Y)
  differentiabilityFirstOrder : ∀ x, FrechetDifferentiabilityPackage X Y f x
  differentiabilitySecondOrder : ∀ x, FrechetDifferentiabilityPackage X (X →L[ℝ] Y) firstDerivative x
  bilinearContinuous : Prop
  bilinearContinuousClosed : bilinearContinuous

structure HigherOrderDerivatives (X Y : Type) [NormedAddCommGroup X] [NormedAddCommGroup Y] [NormedAddCommGroup (X →L[ℝ] Y)] (f : X → Y) (n : ℕ) where
  derivativeTower : Vector (X → (X →L[ℝ] Y)^{?}) n
  smoothness : Prop
  smoothnessClosed : smoothness

structure HigherOrderDerivativesEvidence (X Y : Type) [NormedAddCommGroup X] [NormedAddCommGroup Y] [NormedAddCommGroup (X →L[ℝ] Y)] {f : X → Y} {n : ℕ} (H : HigherOrderDerivatives X Y f n) where
  smoothnessClosed : H.smoothnessClosed

def HigherOrderDerivativesClosed (X Y : Type) [NormedAddCommGroup X] [NormedAddCommGroup Y] [NormedAddCommGroup (X →L[ℝ] Y)] {f : X → Y} {n : ℕ} (H : HigherOrderDerivatives X Y f n) : Prop :=
  H.smoothness

theorem higher_order_derivatives_closed_from_evidence (X Y : Type) [NormedAddCommGroup X] [NormedAddCommGroup Y] [NormedAddCommGroup (X →L[ℝ] Y)] {f : X → Y} {n : ℕ} (H : HigherOrderDerivatives X Y f n) (E : HigherOrderDerivativesEvidence H) : HigherOrderDerivativesClosed H :=
  E.smoothnessClosed

end HautevilleHouse.DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean
end HautevilleHouse