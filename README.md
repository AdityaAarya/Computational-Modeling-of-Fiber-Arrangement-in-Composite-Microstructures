# Fiber Distribution Uniformity Analysis

## Project Overview

This project analyzes fiber distribution uniformity in composite materials by simulating the random placement of circular fibers within a square block and calculating inter-fiber spacing statistics. The analysis focuses on understanding how volume fraction (Vf) affects fiber distribution patterns and spacing characteristics.

## Objectives

- Generate random fiber distributions in a 1mm × 1mm square block
- Ensure no fiber overlap or edge interference
- Calculate fiber quantities for different volume fractions (10%, 30%, 60%)
- Analyze inter-fiber spacing statistics for randomly selected fibers in the central region
- Evaluate distribution uniformity metrics

## Methodology

### Fiber Placement Algorithm

The fiber placement follows a collision-detection approach:

1. **Domain Setup**: 1mm × 1mm square block with 6 μm diameter fibers
2. **Volume Fraction Calculation**: 
   ```
   Number of fibers = (Vf × Block Area) / Fiber Area
   ```
3. **Random Placement**: Fibers are placed randomly while ensuring:
   - No overlap between fibers (center-to-center distance ≥ fiber diameter)
   - No intersection with block boundaries
   - Maximum placement attempts to avoid infinite loops

### Inter-fiber Spacing Analysis

For each volume fraction:
1. **Central Region Selection**: Random fiber selected from 0.5mm × 0.5mm central area
2. **Edge-to-Edge Distance Calculation**:
   ```
   Edge-to-Edge Distance = max(Center Distance - Fiber Diameter, 0)
   ```
3. **Statistical Analysis**: Average spacing and standard deviation calculated

## Results

### Fiber Distribution Visualizations

The analysis generates three key visualization scenarios:

#### High Volume Fraction (Vf = 60.0%)
- **Number of Fibers**: 21,220
- **Average Spacing**: 0.300 mm
- **Standard Deviation**: 0.135 mm
- **Characteristics**: Dense, tightly packed distribution with uniform coverage

#### Medium Volume Fraction (Vf = 30.0%)
- **Number of Fibers**: 10,610
- **Average Spacing**: 0.274 mm
- **Standard Deviation**: 0.126 mm
- **Characteristics**: Moderate density with visible spacing between fibers

#### Low Volume Fraction (Vf = 10.0%)
- **Number of Fibers**: 3,536
- **Average Spacing**: 0.222 mm
- **Standard Deviation**: 0.103 mm
- **Characteristics**: Sparse distribution with significant inter-fiber gaps

### Key Observations

1. **Counter-intuitive Spacing Trend**: Average spacing increases with volume fraction, which occurs because:
   - Higher Vf creates more potential neighbors
   - Statistical averaging includes more distant fibers
   - Geometric constraints become more significant

2. **Standard Deviation Pattern**: Variability increases with volume fraction, indicating:
   - More heterogeneous local environments
   - Greater range of nearest-neighbor distances
   - Complex spatial interactions

3. **Randomness Impact**: Each simulation run selects a different random fiber from the central region, producing varying results that reflect the stochastic nature of the distribution.

## Technical Implementation

### Core Features

- **Collision Detection**: Efficient algorithm preventing fiber overlap
- **Boundary Constraints**: Ensures fibers remain within domain boundaries  
- **Central Region Analysis**: Focuses on 0.5mm × 0.5mm area for consistent sampling
- **Statistical Calculations**: Robust computation of mean and standard deviation
- **Visualization**: Color-coded plots distinguishing central region (red) from outer area (blue)

### Algorithm Complexity

- **Time Complexity**: O(n²) for overlap checking during placement
- **Space Complexity**: O(n) for storing fiber positions
- **Convergence**: Maximum attempt limit prevents infinite loops in high-density scenarios

## Distribution Uniformity Metrics

### Current Measures
1. **Average Inter-fiber Spacing**: Mean edge-to-edge distance
2. **Standard Deviation**: Measure of spacing variability

### Additional Uniformity Metrics (Recommendations)

1. **Coefficient of Variation (CV)**:
   ```
   CV = Standard Deviation / Mean
   ```
   - Normalized measure independent of absolute spacing values
   - Lower CV indicates more uniform distribution

2. **Nearest Neighbor Index (NNI)**:
   ```
   NNI = Observed Mean Distance / Expected Random Distance
   ```
   - Values near 1.0 indicate random distribution
   - Values < 1.0 suggest clustering
   - Values > 1.0 indicate regular/uniform spacing

3. **Ripley's K-Function**: Analyzes spatial clustering at multiple scales

4. **Voronoi Diagram Analysis**: 
   - Area variance of Voronoi cells
   - Shape regularity measures

5. **Radial Distribution Function**: Probability of finding neighbors at specific distances

6. **Local Density Variation**: Standard deviation of local fiber density across sub-regions

## Usage Instructions

1. **Setup**: Configure block dimensions and fiber properties
2. **Execution**: Run analysis for desired volume fractions
3. **Interpretation**: Analyze spacing statistics and distribution patterns
4. **Visualization**: Review generated plots for qualitative assessment

## Applications

- **Composite Material Design**: Optimizing fiber arrangements for mechanical properties
- **Quality Control**: Assessing manufacturing consistency
- **Numerical Modeling**: Providing realistic fiber distributions for FEA simulations
- **Material Property Prediction**: Correlating distribution uniformity with performance

## Limitations

- **2D Analysis**: Real composites are 3D structures
- **Circular Cross-sections**: Actual fibers may have different geometries
- **Perfect Rigidity**: No fiber deformation during placement
- **Infinite Placement Attempts**: May not converge for very high volume fractions

## Future Enhancements

1. **3D Extension**: Volumetric fiber distribution analysis
2. **Non-circular Fibers**: Elliptical or irregular fiber shapes
3. **Clustering Analysis**: Advanced spatial statistics
4. **Multi-scale Analysis**: Different fiber size distributions
5. **Optimization Algorithms**: Targeted uniformity improvements

## Conclusion

This analysis provides valuable insights into fiber distribution characteristics and their relationship with volume fraction. The counter-intuitive spacing trends highlight the importance of statistical analysis in understanding composite microstructures. The framework established here can be extended to more complex scenarios and provides a foundation for advanced composite material analysis.

---

*Note: This is an educational/research project demonstrating computational methods for composite material analysis. The simulation results showcase proficiency in Monte Carlo methods, spatial statistics, collision detection algorithms, and materials science applications.*
