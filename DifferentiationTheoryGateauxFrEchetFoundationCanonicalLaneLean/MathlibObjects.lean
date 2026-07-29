import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean

structure DifferentiableSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  norm : carrier → ℝ

def DifferentiableSpace.banach (s : DifferentiableSpace) : Prop :=
  CompleteSpace s.carrier ∧ NormedAddCommGroup s.carrier

structure DifferentiableAdmittedObject where
  space : DifferentiableSpace
  differentiableMap : Prop
  frechetDerivativeExists : Prop
  conclusion : frechetDerivativeExists

structure DifferentiableEndgameState where
  object : DifferentiableAdmittedObject

def DifferentiableWitnessClosed (O : DifferentiableAdmittedObject) : Prop :=
  O.frechetDerivativeExists

end DifferentiationTheoryGateauxFrEchetFoundationCanonicalLaneLean
end HautevilleHouse
